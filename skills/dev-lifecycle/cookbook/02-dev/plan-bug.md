# Plan Bug Fix

## Purpose

Create a root-cause-oriented bug fix plan. Use this when the user reports broken behavior and wants a precise plan before coding.

## Inputs

- `$ARGUMENTS`: Bug description, symptoms, reproduction notes, task ID, logs, screenshots, or related files.

## Process

1. **Load project context.**
   Follow **Project Context Loading** from `references/shared-patterns.md`.

2. **Read the planning pattern.**
   Read `references/work-planning.md`, especially **Shared Work Planning Pattern** and **Bug Plan Format**.

3. **Resolve identifiers.**
   Determine `task-id` and `short-description`. If the input has no task ID, use a descriptive slug.

4. **Research and reproduce where possible.**
   Inspect relevant code paths, tests, logs, recent changes, and issue context. If safe and practical, identify reproduction steps or a failing test shape.

5. **Analyze root cause.**
   Separate symptoms from cause. Keep the proposed fix surgical and aimed at the smallest coherent change.

6. **Clarify only blocking gaps.**
   Ask concise questions when the expected behavior or reproduction path is unclear.

7. **Write the plan.**
   Use the Bug Plan Format. Include reproduction steps, root cause analysis, regression tests, and validation commands.

## Output

Save to:

```text
./specs/<task-id>-<short-description>/<task-id>-bug-plan.md
```

Create directories if they do not exist.

## Rules

- Prioritize root cause and regression prevention.
- Keep scope narrow. Do not bundle unrelated cleanup.
- Validation should include a reproduction or regression command when possible.
- Follow Writing Style Rules from `references/shared-patterns.md`.
