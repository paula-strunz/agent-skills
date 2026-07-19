# Generate Unit Tests

## Purpose

Analyze code structure and key behaviors, then generate focused unit tests for critical functionality using the project's test framework. Produces tests that verify behavior (not implementation details), follow consistent naming conventions, and properly mock external dependencies.

## Inputs

- `$ARGUMENTS`: The module, class, or function to generate tests for
- Project context loaded at runtime for test conventions

## Process

1. **Load project context.**
   Follow **Project Context Loading** from `references/shared-patterns.md` to understand test conventions, frameworks, directory structure, and any project-specific test patterns.

2. **Read the target code.**
   Examine the module, class, or function specified in `$ARGUMENTS`. Understand its public API, dependencies, edge cases, and error paths.

3. **Identify Key Behaviors**
   - Core functionality that must work correctly
   - Critical error conditions
   - Important edge cases
   - State changes and side effects

4. **Generate Focused Tests**

   Use the Given/When/Then structure. Examples below use pytest syntax, but adapt them to the framework already used in the repo:

   ```python
   import pytest
   from unittest.mock import Mock, patch

   def test_<function>_<behavior>():
       # Given: Setup
       # When: Action
       # Then: Assert
   ```

5. **Apply test naming convention:**
   - `test_<what>_<condition>_<expected>`
   - Be specific: `test_process_invalid_input_raises_validation_error`

6. **Mock external dependencies properly:**

   ```python
   @patch("mymodule.external_client.call")
   def test_handler_returns_fallback_on_api_error(mock_call):
       mock_call.side_effect = ConnectionError("timeout")
       result = handler.process(input_data)
       assert result == fallback_value
   ```

7. **Handle async code** if the project uses async patterns:

   ```python
   @pytest.mark.asyncio
   async def test_fetch_data_returns_expected_result():
       # Given
       mock_client = AsyncMock(return_value={"key": "value"})

       # When
       result = await fetch_data(client=mock_client)

       # Then
       assert result["key"] == "value"
   ```

## Focus Areas

- **Core Logic**: The main purpose of the code
- **Error Handling**: What happens when things go wrong
- **Integration Points**: Mocking external services
- **Data Validation**: Input/output contracts

## What to Skip

- Trivial getters/setters
- Simple data classes with no logic
- One-line passthrough functions
- Excessive permutations of similar cases

## Output

Save test files to the location specified by the user. If no location is given, follow the project's test directory conventions (e.g., `tests/` mirroring `src/` structure).

## Rules

- Write tests that verify behavior, not implementation details.
- Each test should test one thing. If you need "and" in the test name, split it.
- Follow the Writing Style Rules from shared-patterns.md for any docstrings or comments.
- Prefer the framework's native exception assertion helpers over manual try/except blocks.
- Use fixtures for shared setup, but keep test-specific setup inline for clarity.
