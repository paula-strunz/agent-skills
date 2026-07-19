# Plan Feature Work

## Purpose

Create an implementation plan for a net new feature. Use this when the user has a feature request or ticket and wants a researched, executable plan before coding.

## Inputs

- `$ARGUMENTS`: Feature description, task ID, ticket text, branch name, or related files.

## Process

1. **Load project context.**
   Follow **Project Context Loading** from `references/shared-patterns.md`.

2. **Read the planning pattern.**
   Read `references/work-planning.md`, especially **Shared Work Planning Pattern** and **Feature Plan Format**.

3. **Resolve identifiers.**
   Determine `task-id` and `short-description`. If the input has no task ID, use a descriptive slug.

4. **Research the codebase.**
   Inspect relevant source files, tests, docs, dependency manifests, scripts, task runners, and existing patterns. Derive relevant files from the repository instead of using a fixed list.

5. **Clarify only blocking gaps.**
   Ask concise questions when the feature scope, expected behavior, or acceptance criteria cannot be inferred safely.

6. **Write the plan.**
   Use the Feature Plan Format. Include implementation phases, step-by-step tasks, test strategy, acceptance criteria, and validation commands.

## Output

Save to:

```text
./specs/<task-id>-<short-description>/<task-id>-feature-plan.md
```

Create directories if they do not exist.

## Rules

- Keep the plan specific to the repository.
- Prefer existing patterns and project tooling.
- Do not invent requirements. Put assumptions in Notes when the user asks you to proceed without clarification.
- Follow Writing Style Rules from `references/shared-patterns.md`.
