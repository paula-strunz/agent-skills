# Write PR Description

## Purpose

Generate a clear, professional Pull Request description from a branch diff and optional ticket context. Produces a structured PR description ready for code review, saved to a file for easy copy-paste into the PR tool.

## Inputs

- `$ARGUMENTS`: One or more of the following (all optional):
  - Branch name (or "current" to use the active branch)
  - Ticket ID
  - Ticket description or context
- Project context loaded at runtime

## Process

1. **Load project context.**
   Follow **Project Context Loading** from `references/shared-patterns.md` to understand PR conventions, branch naming, and commit style.

2. **Resolve the branch.**
   If the input says "current" or no branch is specified, run `git branch --show-current` to get the active branch. Otherwise use the branch name provided.

3. **Determine the base branch.**
   Check project guidance files for the main/default branch. If not specified, check `git config init.defaultBranch`, inspect remote HEAD when available, or ask the user. Common defaults: `main`, `master`, `dev`, `develop`.

4. **Get the diff.**
   Run `git diff <base-branch>...<branch>` (or `git diff <base-branch>...HEAD` if on current branch) to understand what changed. Also run `git log <base-branch>...<branch> --oneline` to see the commit history.

5. **Parse ticket context.**
   If a ticket ID or description was provided in `$ARGUMENTS`, use it to frame the "why" behind the changes. If none was given, infer intent from the diff and commit messages.

6. **Extract the TaskID.**
   Parse the TaskID from the branch name using the project's branch naming convention. Common patterns:
   - `feature/ABC-123/some-work` yields `ABC-123`
   - `fix/PROJ-456-description` yields `PROJ-456`
   - If a ticket ID was provided in `$ARGUMENTS`, prefer that instead.
   - If no TaskID can be extracted, ask the user or use "NONE".

7. **Generate the PR title and description** using the template below. Be concise and developer-friendly. Every sentence should carry information.

## Template

```markdown
# [Type/TaskID: Description]

## Summary

[2-4 sentences. What does this PR do and why? Reference the ticket ID if provided, e.g. "Closes #1234".]

## Changes

- [File or module]: [what changed and why]
- [File or module]: [what changed and why]
- ...

## Testing

- [ ] [How was this tested? Unit tests, manual, integration, etc.]
- [ ] Existing tests pass

## Notes

[Any trade-offs, follow-ups, known limitations, or reviewer focus areas. Write "N/A" if none.]
```

## Output

Save the generated PR description to: `./specs/<task-id>-<short-description>/<task-id>-pr-description.md`

Create the directory if it does not exist. If no TaskID is available, use the branch name slug.

## Rules

- **PR title format:** `Type/TaskID: Description`, where Type is `feature|release|hotfix|chore|experiment|bug|documentation` (or follow the project's convention).
- **Be concise.** A reviewer should grasp the full scope in under 2 minutes.
- **Changes section:** Group related files. Reference actual file paths or module names from the diff. Do not list every single file if the change is large, group by concern.
- **Do not invent intent** that is not visible in the diff or ticket. If something is ambiguous, note it in the Notes section.
- **Output only the PR description.** No preamble, no explanation around it.
- Follow the Writing Style Rules from shared-patterns.md.
