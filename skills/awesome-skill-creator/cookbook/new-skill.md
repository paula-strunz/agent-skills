# Purpose

Create a new skill from scratch using a router-first structure.

## Variables

TRIGGER_EXAMPLE_TARGET: 3-5
DEFAULT_STARTER: templates/skill-template/SKILL.template.md
ENABLE_SCAFFOLD_SCRIPT: true

## Inputs To Capture

- Skill goal and target outcome
- 3-5 realistic trigger phrases
- Typical inputs the skill receives
- Expected outputs or artifacts
- Fragile or repetitive steps that deserve supporting files

## Instructions

- Use `prompts/skill-design-prompt.md` as an in-memory brief if the workflow is still fuzzy.
- Choose the skill name early, then tighten the description with `references/naming-and-triggering.md`.
- If the folder does not exist yet, run `scripts/new_skill_scaffold.sh <skill-name> <base-dir>` to create the initial router and primary cookbook.
- Start from `templates/skill-template/SKILL.template.md`, then remove sections that are not needed.
- Keep `SKILL.md` at route-selection level. Create one cookbook file per major workflow mode.
- If the skill runs for long enough that users would otherwise need to keep checking manually, document an OpenClaw-native `agent.wait` style pattern with occasional meaningful progress updates and a final completion-or-timeout report.
- Add `prompts/`, `templates/`, `references/`, `scripts/`, and `checklists/` only when they make repeated execution meaningfully better.
- Validate the result with `checklists/quality-gate.md` before finishing.

## Deliverables

- One new skill folder with valid frontmatter
- One or more focused cookbook files
- Only the supporting resources required for repeated use
