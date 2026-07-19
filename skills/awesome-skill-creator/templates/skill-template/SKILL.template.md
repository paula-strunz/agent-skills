---
name: <skill-name-lowercase-hyphen>
description: <one sentence: what it does + explicit when-to-use triggers>
---

# Purpose

<One concise paragraph about the skill outcome>

## Variables

DEFAULT_ROUTE: primary

## Instructions

- Parse the user's request and choose the right route.
- Keep `SKILL.md` concise; put route-specific detail in cookbook files.
- Add only the supporting resources that improve repeated execution.

## Workflow

1. <shared step>
2. <shared step>
3. <shared step>

## Cookbook

### Primary Route

- IF: <condition>
- THEN: Read and execute `cookbook/primary.md`
- EXAMPLES:
  - "<example request>"

## Resource Map

- `cookbook/primary.md`: <main execution path>
- `prompts/`: <prompt scaffolds to fill in memory>
- `templates/`: <starter artifacts to copy or edit>
- `references/`: <deep docs to load on demand>
- `scripts/`: <deterministic helpers worth reusing>
- `checklists/`: <completion gates>

## Output Contract

- <artifact 1>
- <artifact 2>
- <artifact 3>
