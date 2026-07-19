# Implement Plan

## Purpose

Implement an existing plan or spec file. Use this when the user points to a lifecycle artifact under `specs/` or provides a concrete plan to execute.

## Inputs

- `$ARGUMENTS`: Path to a plan/spec file, pasted plan content, or task ID that identifies the plan.

## Process

1. **Load project context.**
   Follow **Project Context Loading** from `references/shared-patterns.md`.

2. **Read the plan.**
   If `$ARGUMENTS` is a path, read it. If it is a task ID, search `./specs/` for matching files. If it is pasted content, use it directly.

3. **Check for blockers.**
   Identify missing requirements, risky ambiguity, environment prerequisites, and validation commands. Ask only when implementation would be unsafe or impossible without clarification.

4. **Implement step by step.**
   Follow the plan in order. Keep changes scoped to the plan unless the codebase reveals a necessary adjustment.

5. **Update tests and docs when required.**
   Add or modify tests, evals, docs, or config only when the plan or implementation requires it.

6. **Run validation.**
   Execute the plan's validation commands when practical. If commands are stale or unavailable, run the closest project-equivalent commands and report the substitution.

7. **Report completion.**
   Use the Implementation Report Format from `references/work-planning.md`.

## Output

Code, tests, docs, or config changes in the repository. No new planning artifact is required unless the user asks for one.

## Rules

- Do not ignore the plan. If implementation must diverge, explain why in the final report.
- Keep edits scoped.
- Never revert unrelated user changes.
- Follow Writing Style Rules from `references/shared-patterns.md` for generated docs or comments.
