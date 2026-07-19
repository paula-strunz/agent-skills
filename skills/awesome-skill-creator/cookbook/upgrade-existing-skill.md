# Purpose

Upgrade an existing skill without throwing away working structure or useful resources.

## Variables

PRESERVE_WORKING_TERMS: true
PREFER_INCREMENTAL_REFACTOR: true
MOVE_ROUTE_DETAIL_TO_COOKBOOK: true

## Audit Focus

- Weak or vague frontmatter
- `SKILL.md` sections that mix routing with long execution detail
- Missing cookbook routes for distinct user intents
- Duplicate guidance spread across multiple files
- Missing prompts, templates, scripts, or checklists that would reduce repeated work

## Instructions

- Read the current skill before changing structure. Preserve useful terminology and stable trigger phrases when they already work.
- Tighten the `description` so it says what the skill does and when to use it.
- Move route-specific detail out of `SKILL.md` and into `cookbook/` files whenever the skill supports multiple modes or branches.
- Keep shared rules in `Variables`, `Instructions`, and `Workflow`; keep specialized procedures in cookbook files.
- Update or remove supporting files only when they materially improve or simplify execution.
- Finish with `checklists/quality-gate.md` to confirm the refactor improved operational quality rather than just rearranging text.

## Deliverables

- An updated skill with a clearer router
- Supporting files aligned to real execution paths
- Fewer duplicated instructions and better trigger quality
