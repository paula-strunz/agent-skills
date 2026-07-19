# Router Pattern

Use this pattern when a skill supports more than one meaningful execution path or when `SKILL.md` is getting too heavy.

## Shared Shape

- `Purpose`: one short paragraph describing the outcome
- `Variables`: shared toggles, defaults, aliases, or constraints
- `Instructions`: global rules that apply to every route
- `Workflow`: short numbered sequence for the common execution path
- `Cookbook`: `IF` / `THEN` routes into focused files

## What Stays In SKILL.md

- Shared routing logic
- Shared guardrails
- High-level workflow
- References to the supporting files

## What Moves Out

- Route-specific execution steps
- Dense examples or edge-case handling
- Prompt templates that need placeholders
- Checklists and validation criteria
- Deterministic helper logic that belongs in scripts

## Split Triggers

Create a separate cookbook route when any of these are true:

- The user intent changes the execution steps
- Different tools or artifacts are used
- The skill needs different prompts or templates
- Conditional logic is making `SKILL.md` harder to scan
