# Naming and Triggering Notes

## Naming

- Prefer verb-led names: `build-...`, `generate-...`, `review-...`
- Keep names concise and specific.
- Use lowercase letters, digits, and hyphens only.
- Preserve an established name if renaming would create churn without meaningfully improving trigger quality.

## Triggering

A strong description should include:
1. Domain or task scope
2. Explicit "use when" contexts
3. Common user intents such as create, fix, refactor, report, or analyze
4. Enough specificity that 3-5 realistic requests obviously match

## Good Description Pattern

"<Do X and Y>. Use when <situation A>, <situation B>, or <situation C>."

## Quick Review Questions

- Would another agent know to trigger the skill from the frontmatter alone?
- Does the description describe concrete requests instead of general capability claims?
- Does the name still fit if the skill gains one adjacent workflow?
