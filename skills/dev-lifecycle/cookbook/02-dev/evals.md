# Generate Evaluation Tests

## Purpose

Generate evaluation test suites for LLM-based features. Evals measure whether prompts, agents, and AI-powered workflows produce correct, consistent, and high-quality outputs. This cookbook covers accuracy evals, regression evals, and prompt quality evals, producing test files that fit the project's eval and CI conventions.

## Inputs

- `$ARGUMENTS`: The LLM feature, prompt, or agent to evaluate (e.g., "the summarization prompt", "the classification agent", "the RAG retrieval pipeline")
- Project context loaded at runtime

## Process

1. **Load project context.**
   Follow **Project Context Loading** from `references/shared-patterns.md` to understand AI features, prompt locations, model configurations, and existing eval infrastructure.

2. **Read the target feature.**
   Examine the prompt, agent, or pipeline specified in `$ARGUMENTS`. Understand:
   - What input it receives
   - What output it produces
   - What "correct" looks like
   - What failure modes exist

3. **Design the eval dataset.**
   Create or reference a set of test cases with known expected outputs. Examples use pytest-style syntax, but adapt them to the project's existing eval framework:

   ```python
   EVAL_CASES = [
       {
           "input": "Patient presents with fatigue and joint pain",
           "expected_keywords": ["differential", "autoimmune"],
           "expected_format": "structured_analysis",
           "difficulty": "standard",
       },
       {
           "input": "",
           "expected_behavior": "graceful_error",
           "difficulty": "edge_case",
       },
   ]
   ```

4. **Select eval strategies** based on what the feature does:

   **Accuracy Evals** (does it get the right answer?):
   - Exact match for classification/extraction tasks
   - Keyword/semantic overlap for generation tasks
   - Structured output validation (JSON schema, required fields)

   **Regression Evals** (did the last change break anything?):
   - Golden output comparison against a baseline
   - Score threshold checks (must stay above X%)
   - A/B comparison between prompt versions

   **Prompt Quality Evals** (is the output well-formed?):
   - Output format compliance
   - Hallucination detection (claims not grounded in input)
   - Instruction following (did it respect all constraints?)
   - Tone and style consistency

5. **Generate the eval test file.**

### Accuracy Eval Pattern

```python
import pytest

EVAL_CASES = [...]  # defined above

@pytest.mark.eval
@pytest.mark.parametrize("case", EVAL_CASES, ids=lambda c: c.get("id", str(c["input"][:30])))
async def test_output_accuracy(case, llm_client):
    """Verify the model produces correct outputs for known inputs."""
    result = await llm_client.run(case["input"])

    if "expected_exact" in case:
        assert result.output == case["expected_exact"]
    elif "expected_keywords" in case:
        output_lower = result.output.lower()
        for keyword in case["expected_keywords"]:
            assert keyword.lower() in output_lower, (
                f"Missing expected keyword '{keyword}' in output"
            )
```

### Regression Eval Pattern

```python
import json
from pathlib import Path

GOLDEN_PATH = Path("tests/evals/golden_outputs/")

@pytest.mark.eval
async def test_no_regression_from_baseline(llm_client):
    """Compare current outputs against golden baseline."""
    golden = json.loads((GOLDEN_PATH / "baseline.json").read_text())

    passed = 0
    total = len(golden)
    failures = []

    for case in golden:
        result = await llm_client.run(case["input"])
        if meets_criteria(result.output, case["expected"]):
            passed += 1
        else:
            failures.append({"input": case["input"], "got": result.output})

    pass_rate = passed / total
    assert pass_rate >= 0.90, (
        f"Regression detected: {pass_rate:.0%} pass rate (threshold: 90%). "
        f"Failures: {json.dumps(failures[:3], indent=2)}"
    )
```

### Prompt Quality Eval Pattern

```python
@pytest.mark.eval
@pytest.mark.parametrize("case", EVAL_CASES)
async def test_output_format_compliance(case, llm_client):
    """Verify output follows the expected format and constraints."""
    result = await llm_client.run(case["input"])

    # Format check
    if case.get("expected_format") == "json":
        parsed = json.loads(result.output)  # fails if not valid JSON
        for field in case.get("required_fields", []):
            assert field in parsed, f"Missing required field: {field}"

    # Length check
    if "max_length" in case:
        assert len(result.output) <= case["max_length"]

    # Hallucination check (output should only reference input content)
    if case.get("check_grounding"):
        assert_grounded(result.output, case["input"])
```

### LLM-as-Judge Pattern

```python
JUDGE_PROMPT = """
Rate the following output on a scale of 1-5 for each criterion:
- Accuracy: Does it correctly address the input?
- Completeness: Does it cover all relevant aspects?
- Format: Does it follow the required structure?

Input: {input}
Output: {output}

Respond with JSON: {{"accuracy": N, "completeness": N, "format": N}}
"""

@pytest.mark.eval
@pytest.mark.slow
async def test_output_quality_via_judge(llm_client, judge_client):
    """Use a separate LLM to evaluate output quality."""
    for case in EVAL_CASES:
        result = await llm_client.run(case["input"])
        scores = await judge_client.run(
            JUDGE_PROMPT.format(input=case["input"], output=result.output)
        )
        parsed = json.loads(scores.output)
        assert all(v >= 3 for v in parsed.values()), (
            f"Quality below threshold: {parsed}"
        )
```

6. **Add fixtures for the LLM client.**

   ```python
   @pytest.fixture
   async def llm_client():
       """Create a configured LLM client for evals."""
       # Adapt to the project's actual LLM client setup
       client = create_eval_client(
           model=os.getenv("EVAL_MODEL", "default-model"),
           temperature=0,  # deterministic for evals
       )
       yield client
   ```

## Output

Generate eval test files saved to the location specified by the user. If no path is given, follow the project's eval conventions. Example default for Python projects: `tests/evals/test_<feature>_evals.py`

Also generate (if applicable):
- `tests/evals/eval_data/<feature>_cases.json` for the eval dataset
- `tests/evals/golden_outputs/<feature>_baseline.json` for regression baselines

## Eval Design Principles

- **Deterministic where possible.** Use temperature=0 for evals. If outputs are non-deterministic, run multiple times and assert on pass rate (e.g., 8/10 must pass).
- **Separate data from logic.** Keep eval cases in JSON or as parametrized data, not hardcoded in test bodies.
- **Fast feedback loop.** Mark expensive evals with the project's slow-test mechanism so developers can run cheap evals frequently and full suites in CI.
- **Measure, don't just assert.** Log scores and pass rates even on success. This creates a baseline for detecting gradual degradation.

## Rules

- Follow the Writing Style Rules from shared-patterns.md.
- Each eval should test one dimension of quality (accuracy, format, grounding). Combine dimensions in a summary test if needed.
- Never hardcode API keys or model endpoints in test files. Use environment variables or fixtures.
- Include clear failure messages that show what was expected vs what was produced.
