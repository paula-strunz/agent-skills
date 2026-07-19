---
name: awesome-skill-creator
description: Design, build, and upgrade high-quality AgentSkills using a router-first SKILL.md, strong trigger descriptions, and modular supporting resources. Use when creating a new skill from scratch, refactoring an existing skill into a cookbook-driven structure, tightening weak frontmatter or triggering, or standardizing templates, prompts, scripts, and checklists.
---

# Purpose

Build production-grade skills with a thin router-style `SKILL.md` that dispatches to the right cookbook, prompt, template, reference, or script.

## Variables

DEFAULT_SKILL_SHAPE: router-with-cookbooks
REQUIRED_FRONTMATTER_FIELDS: name, description
TRIGGER_EXAMPLE_TARGET: 3-5
ENABLE_NEW_SKILL: true
ENABLE_UPGRADE_EXISTING_SKILL: true
ENABLE_ROUTER_REFACTOR: true
ENABLE_FRONTMATTER_TUNING: true
ENABLE_RESOURCE_PACKAGING: true
ENABLE_SCAFFOLD_SCRIPT: true

## Instructions

- Parse the request before editing anything:
  - target skill: new skill or existing skill folder
  - primary goal: create, upgrade, refactor, rename, fix triggering, add resources
  - workflow modes: the distinct execution paths the skill must support
  - concrete triggers: at least `TRIGGER_EXAMPLE_TARGET` realistic request examples
- Keep `SKILL.md` lean. Put route-specific detail in `cookbook/` files and deeper guidance in `prompts/`, `templates/`, `references/`, `scripts/`, or `checklists/`.
- For long-running skills, prefer an OpenClaw-native `agent.wait` style execution pattern with occasional meaningful progress updates and a final completion-or-timeout report instead of inventing custom polling/state files unless the task truly requires them.
- Prefer direct edits to the target skill over writing advisory prose about what someone else should do.
- Use prompt files as templates to fill in memory. Do not overwrite them unless the task is to improve the prompt itself.
- Ask the user only if the target skill or intended behavior is genuinely ambiguous and a safe assumption is not available.

## Workflow

1. Understand the target outcome and collect 3-5 realistic triggers.
2. Read `references/naming-and-triggering.md` if the skill name or description is part of the work.
3. Choose the correct route from `Cookbook` and read only the matching files.
4. If creating a new skill from scratch and `ENABLE_SCAFFOLD_SCRIPT` is true, use `scripts/new_skill_scaffold.sh`.
5. Update the target `SKILL.md` first so it becomes a clear router.
6. Add or refine only the supporting resources required by the selected route.
7. Validate the result with `checklists/quality-gate.md`.

## Cookbook

### New Skill From Scratch

- IF: The user wants a brand new skill and `ENABLE_NEW_SKILL` is true.
- THEN: Read and execute `cookbook/new-skill.md`.
- EXAMPLES:
  - "create a skill for reviewing migrations"
  - "build a new skill that drafts design docs"
  - "make a skill for triaging production incidents"

### Upgrade Existing Skill

- IF: The user has an existing skill that is weak, messy, or incomplete and `ENABLE_UPGRADE_EXISTING_SKILL` is true.
- THEN: Read and execute `cookbook/upgrade-existing-skill.md`.
- EXAMPLES:
  - "improve this skill"
  - "tighten the workflow and resources in this existing skill"
  - "make this skill more production-grade"

### Router Refactor

- IF: The main problem is that `SKILL.md` is overloaded and should dispatch to smaller execution guides, and `ENABLE_ROUTER_REFACTOR` is true.
- THEN: Read and execute `cookbook/router-refactor.md`.
- EXAMPLES:
  - "turn this skill into a router"
  - "split the workflow into cookbooks"
  - "make SKILL.md mostly dispatch logic"

### Frontmatter And Trigger Tuning

- IF: The user mainly needs stronger naming, description, or trigger quality and `ENABLE_FRONTMATTER_TUNING` is true.
- THEN: Read and execute `cookbook/frontmatter-and-triggering.md`.
- EXAMPLES:
  - "improve this skill description"
  - "fix the triggering"
  - "rename this skill and tighten the frontmatter"

### Resource Packaging

- IF: The user mainly needs help deciding which templates, prompts, references, scripts, or checklists belong in the skill and `ENABLE_RESOURCE_PACKAGING` is true.
- THEN: Read and execute `cookbook/resource-packaging.md`.
- EXAMPLES:
  - "what files should this skill include"
  - "add the right supporting resources"
  - "move bulky details out of SKILL.md"

## Resource Map

- Router pattern reference: `references/router-pattern.md`
- Naming and trigger guide: `references/naming-and-triggering.md`
- Design brief template: `prompts/skill-design-prompt.md`
- Router-style starter: `templates/skill-template/SKILL.template.md`
- Quality gate: `checklists/quality-gate.md`
- Optional scaffold script: `scripts/new_skill_scaffold.sh`

## Output Contract

- One valid `SKILL.md` with only `name` and `description` in frontmatter.
- A router-style body when the skill has multiple execution paths.
- Supporting files that map cleanly to real workflows.
- No speculative or noisy files that do not improve repeated execution.
