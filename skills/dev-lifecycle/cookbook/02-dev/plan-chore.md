# Plan Chore Work

## Purpose

Create a maintenance plan for chores such as dependency updates, refactors, cleanup, documentation sync, tooling changes, or repository hygiene work.

## Inputs

- `$ARGUMENTS`: Chore description, task ID, maintenance goal, affected area, or related files.

## Process

1. **Load project context.**
   Follow **Project Context Loading** from `references/shared-patterns.md`.

2. **Read the planning pattern.**
   Read `references/work-planning.md`, especially **Shared Work Planning Pattern** and **Chore Plan Format**.

3. **Resolve identifiers.**
   Determine `task-id` and `short-description`. If the input has no task ID, use a descriptive slug.

4. **Research the repository.**
   Inspect the relevant files, dependency manifests, scripts, tests, CI config, and existing conventions.

5. **Define scope boundaries.**
   State what is included and excluded so the chore does not expand into a refactor or feature.

6. **Write the plan.**
   Use the Chore Plan Format. Include ordered tasks and validation commands.

## Output

Save to:

```text
./specs/<task-id>-<short-description>/<task-id>-chore-plan.md
```

Create directories if they do not exist.

## Rules

- Keep the plan simple and complete.
- Avoid opportunistic refactors unless they are required for the chore.
- Follow existing project tooling.
- Follow Writing Style Rules from `references/shared-patterns.md`.
