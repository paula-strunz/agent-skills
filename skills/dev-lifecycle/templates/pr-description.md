# PR Description Template

Use this template for generating pull request descriptions. Fill in all bracketed placeholders.

```markdown
# [Type/TaskID: Short description]

## Summary

[2-4 sentences. What does this PR do and why? Reference the ticket ID if available, e.g., "Closes #1234".]

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

## Rules for filling this template

- **PR title format:** `Type/TaskID: Description` where Type is one of: feature, release, hotfix, chore, experiment, bug, documentation.
- **Be concise.** A reviewer should grasp the full scope in under 2 minutes.
- **Changes section:** Group related files. Reference actual paths from the diff. For large changes, group by concern instead of listing every file.
- **Do not invent intent** not visible in the diff or ticket. Note ambiguities in the Notes section.
