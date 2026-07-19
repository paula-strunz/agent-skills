# Review Change

## Purpose

Review a branch, pull request, patch, or local diff for correctness risks, regressions, missing tests, and maintainability problems.

## Inputs

- `$ARGUMENTS`: PR number or URL, branch name, commit range, file path, patch, or "current diff".

## Process

1. **Load project context.**
   Follow **Project Context Loading** from `references/shared-patterns.md`.

2. **Resolve review scope.**
   Determine whether to review a PR, branch diff, commit range, local changes, or specific files. If scope is ambiguous, ask one concise question.

3. **Collect evidence.**
   Use available project or Git tooling to inspect the diff, touched files, nearby code, tests, and relevant docs. For PRs, use available GitHub or forge tooling when configured.

4. **Review for risk.**
   Prioritize bugs, behavioral regressions, missing tests, security issues, data loss, concurrency hazards, and broken contracts.

5. **Check validation.**
   Identify tests or commands that should cover the change. Run them only when the user asks for execution or when the workflow expects active verification.

6. **Write the review.**
   Use the Review Output Format from `references/work-planning.md`.

## Output

A review report in the conversation unless the user asks to save it. If saved, use:

```text
./specs/<task-id>-<short-description>/<task-id>-review.md
```

## Rules

- Findings come first, ordered by severity.
- Cite file paths and line numbers when possible.
- Do not summarize before listing findings.
- If no issues are found, say so clearly and list residual test gaps or risk.
- Follow Writing Style Rules from `references/shared-patterns.md`.
