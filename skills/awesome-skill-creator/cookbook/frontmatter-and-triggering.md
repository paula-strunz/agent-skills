# Purpose

Strengthen a skill's `name` and `description` so the trigger behavior becomes more reliable.

## Variables

MAX_NAME_LENGTH: 64
TRIGGER_EXAMPLE_TARGET: 3-5
PRESERVE_STABLE_NAMES: true

## Instructions

- Use lowercase letters, digits, and hyphens in `name`.
- Prefer short, specific names. Use verb-led naming when the skill is primarily action-oriented.
- Write the `description` as: what the skill does + when to use it + common request shapes.
- Include concrete intents such as create, refactor, review, summarize, migrate, or analyze instead of vague phrases like "helps with tasks."
- Validate the description against 3-5 realistic user requests. If those requests do not obviously match the description, tighten it again.
- Preserve a stable name when the skill is already in use and the rename would add churn without a meaningful trigger benefit.

## Quick Check

- Could another agent tell when to use the skill from the frontmatter alone?
- Does the description mention real request patterns instead of abstract capabilities?
- Does the name still fit if the skill grows slightly in scope?
