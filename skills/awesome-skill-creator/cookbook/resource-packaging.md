# Purpose

Decide which supporting files belong in a skill and where each type of detail should live.

## Variables

PREFER_FEWER_FILES: true
ROUTE_DETAIL_HOME: cookbook/
REFERENCE_DETAIL_HOME: references/

## Placement Rules

- `cookbook/`: route-specific execution instructions
- `prompts/`: reusable prompt templates that are filled in memory
- `templates/`: starter artifacts that get copied or edited into outputs
- `references/`: dense material loaded on demand
- `scripts/`: deterministic automation or helpers worth reusing
- `checklists/`: completion gates and review criteria

## Instructions

- Start from the workflow, not from file categories. Add a file only when it supports a real repeated need.
- Put shared routing in `SKILL.md`, and put branch-specific detail in `cookbook/`.
- Use `references/` for detailed guidance that would make `SKILL.md` too heavy.
- Use `scripts/` only when deterministic behavior matters or the same code would otherwise be rewritten repeatedly.
- Prefer one strong prompt or template over multiple speculative ones.
- Avoid duplicating the same guidance across `SKILL.md`, cookbook files, and references.

## Expected Result

- Each file has a clear job
- The skill is easier to execute without inflating context
- Empty or low-value directories are avoided
