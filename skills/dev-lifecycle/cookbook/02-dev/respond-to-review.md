# Respond to Review

## Purpose

Evaluate code review comments from any source (human reviewer, GitHub Copilot, AI agent, or local review file), decide which are valid, apply fixes for the accepted ones, and optionally post replies. Reviews can surface real blind spots, but they can also be wrong. Every comment is verified against the code before acting on it.

## Inputs

- `$ARGUMENTS`: One of the following.
  - A GitHub PR URL or PR number (e.g. `https://github.com/org/repo/pull/123`, `PR #123`, `PR 123`).
  - A local file path containing review comments (e.g. `specs/review.md`, `tmp/copilot-review.txt`).
  - Pasted text with review comments directly in the conversation.

## Process

1. **Load project context.**
   Follow **Project Context Loading** from `references/shared-patterns.md`.

2. **Detect the review source.**
   - If `$ARGUMENTS` is a PR URL or number: fetch comments with `gh pr view <number> --comments --json` and `gh api repos/{owner}/{repo}/pulls/{number}/comments`. Read-only. Record that the source is a PR (enables reply posting later).
   - If `$ARGUMENTS` is a file path: read the file.
   - If `$ARGUMENTS` is pasted text: use it directly.

3. **Parse individual comments.**
   Extract each distinct review comment with its file path, line number (when available), and the reviewer's suggestion or concern.

4. **Investigate each comment.**
   For each comment, verify the claim against the actual code. Do not trust a review comment at face value. Read the referenced file and surrounding context. When the comment touches unfamiliar code, cross-cutting concerns, or architectural patterns, spawn an Explore subagent to investigate further. Multiple investigations can run in parallel.

5. **Build the evaluation table.**
   Use the **Review Response Format** from `references/work-planning.md`. Each row evaluates one comment:
   - Is it valid? (Yes, Partial, No)
   - Why? (grounded in what the code actually does)
   - Proposed fix (if valid or partially valid)
   - Proposed reply to the reviewer

   Present the table to the user.

6. **Ask for GO/NOGO.**
   Ask the user which comments to fix and which replies to approve. Wait for explicit confirmation before making any changes.

7. **Apply approved fixes.**
   For each approved fix, make the change. When multiple fixes are independent, run them in parallel via subagents. After all fixes, run the project's validation commands (lint, tests) and report results.

8. **Provide a commit message.**
   If any files changed, suggest a conventional-commit message covering all applied fixes.

9. **Offer to post replies (PR source only).**
   If the review source was a PR URL, ask the user if they want to post the approved replies. This requires temporary `gh` write permission (the user must explicitly approve). Use `gh api` to post individual review comment replies, or `gh pr review` for a top-level review response. Do not post anything without user confirmation.

## Output

The evaluation table is presented in the conversation. No file is saved unless the user asks. If saved, use:

```text
./specs/<task-id>-<short-description>/<task-id>-review-response.md
```

## Rules

- `gh` commands are read-only by default. Write operations (`gh pr review`, `gh api` POST) require explicit user approval each time.
- Never accept a review comment as valid without verifying it against the code. Reviewers (human and AI) can be wrong.
- Spawn Explore subagents for any investigation that needs more than a quick file read. Prefer parallel investigation when comments are independent.
- Spawn general-purpose subagents for applying independent fixes in parallel.
- Do not post replies to a PR unless the user explicitly approves.
- Do not make code changes until the user gives GO on specific comments.
- Follow Writing Style Rules from `references/shared-patterns.md`.
