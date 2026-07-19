# Generate Engineering Specification

## Purpose

Produce a detailed engineering specification through iterative consultation. The spec should be complete enough that any developer can implement the feature without further questions. Uses the Iterative Consultation Pattern to eliminate assumptions before writing the final document.

## Inputs

- `$ARGUMENTS`: Description of the feature or task to specify
- Project context loaded at runtime

## Process

1. **Load project context.**
   Follow **Project Context Loading** from `references/shared-patterns.md` and read any architecture or design docs that exist.

2. **Analyze the request thoroughly.**
   Identify ALL ambiguities, unclear requirements, and implicit assumptions in `$ARGUMENTS`.

3. **Ask clarifying questions.**
   Scale the number of questions with task complexity. Do not proceed until you have complete clarity. Topics to probe:
   - Scope boundaries (what is included, what is explicitly excluded)
   - Expected inputs and outputs
   - Error handling expectations
   - Integration points with existing code
   - Performance or scaling considerations
   - Security implications

4. **Ask follow-up questions.**
   New ambiguities often emerge from initial answers. Continue across multiple rounds until achieving complete clarity.

5. **Maintain a scratchpad** per the Scratchpad Pattern in shared-patterns.md. Path: `./ai_docs/scratchpad/task_spec_scratchpad.md`

6. **Generate the specification** only when you can implement the feature without any further clarification. The spec must include:
   - Summary of the requirement
   - Detailed functional description
   - Technical approach and implementation notes
   - Affected files/modules (discovered from the codebase)
   - Acceptance criteria
   - Edge cases and error scenarios
   - Dependencies and integration points

7. **Engage in refinement.** After the first draft, adjust specific sections without regenerating the entire document.

## Output

Save the final specification to: `./specs/<task-id>-<short-description>/task-spec.md`

If no task ID is available, ask the user or use a descriptive slug.

## Critical Rules

- Never make assumptions about behavior, scope, or implementation details.
- If something could be interpreted multiple ways, ask which interpretation is correct.
- Continue asking questions across multiple rounds until achieving complete clarity.
- The final spec must be detailed enough that any developer could implement it without further questions.
- Follow the Writing Style Rules from shared-patterns.md.

## Escape Clause

If instructed to generate a specification without asking clarification questions, use your best judgment to fill in the gaps, but clearly document all assumptions made in the specification under a dedicated "Assumptions" section.
