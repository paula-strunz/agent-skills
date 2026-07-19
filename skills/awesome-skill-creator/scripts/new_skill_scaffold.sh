#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <skill-name> <base-dir>"
  exit 1
fi

name="$1"
base_dir="$2"
out="$base_dir/$name"

mkdir -p "$out/cookbook"

cat > "$out/SKILL.md" <<EOF
---
name: $name
description: TODO: describe what this skill does and when to use it.
---

# Purpose

TODO

## Variables

DEFAULT_ROUTE: primary

## Instructions

- Parse the user's request and choose the right route.
- Keep SKILL.md concise; put route-specific detail in cookbook files.
- Add prompts, templates, references, scripts, and checklists only when they improve repeated execution.

## Workflow

1. TODO: capture the target outcome and trigger examples
2. TODO: choose the matching cookbook route
3. TODO: execute the route and validate the outputs

## Cookbook

### Primary Route

- IF: The request matches the main workflow for this skill.
- THEN: Read and execute \`cookbook/primary.md\`.
- EXAMPLES:
  - "TODO"

## Resource Map

- \`cookbook/primary.md\`: main execution path
- Add \`prompts/\`, \`templates/\`, \`references/\`, \`scripts/\`, and \`checklists/\` only when they improve repeated execution

## Output Contract

- TODO
- TODO
- TODO
EOF

cat > "$out/cookbook/primary.md" <<EOF
# Purpose

Describe the main execution path for this skill.

## Inputs To Capture

- Goal:
- Typical inputs:
- Expected outputs:
- Fragile steps:

## Instructions

- Replace this file with the concrete steps for the primary workflow.
- Split additional modes into more cookbook files when the workflow branches.
- Add supporting templates, prompts, references, scripts, or checklists only if they improve repeated execution.
EOF

echo "Scaffold created at: $out"
