# Purpose

Turn an overloaded `SKILL.md` into a router that dispatches to smaller, focused cookbooks.

## Variables

MAX_ROUTE_COUNT: 5
DEFAULT_PRIMARY_COOKBOOK: cookbook/primary.md
KEEP_SKILL_MD_LEAN: true

## Router Heuristics

- Split by user intent or execution mode, not by arbitrary file grouping.
- If the skill has only one real path today, a single `cookbook/primary.md` is enough.
- If a section depends on conditional context or grows beyond a compact set of instructions, it probably belongs in a cookbook or reference file.

## Instructions

1. Identify the 2-5 top-level workflow modes the skill actually supports.
2. Rewrite `SKILL.md` so it contains only the shared purpose, variables, instructions, workflow, and route selection.
3. Create one cookbook file per workflow mode with the concrete steps for that route.
4. Add `EXAMPLES` under each route so the trigger logic is obvious.
5. Move deep examples, prompt scaffolds, templates, and dense reference material out of `SKILL.md`.
6. Keep the file tree small. Do not invent cookbooks for modes that are not real.

## Expected Result

- `SKILL.md` is quick to scan and easy to route from
- Cookbook files carry the route-specific operational detail
- The skill becomes easier to maintain and extend
