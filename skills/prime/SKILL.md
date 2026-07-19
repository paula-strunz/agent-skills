---
name: prime
description: Bootstrap a new agent session by loading the current workspace context and reporting available capabilities. Use when the user says prime, /prime, start session, bootstrap this repo, load context, list tools, list skills, or asks what capabilities are available at the start of work.
---

# Purpose

Prepare the agent to work in the current workspace without assuming a specific project. Every `prime` run loads workspace context first, then reports available runtime capabilities.

## Instructions

- Use the current working directory as the workspace root unless the user provides another path.
- Read local instruction files before forming conclusions.
- Prefer repo-local rules over generic assumptions.
- Do not assume project names, repo topology, tools, or commands from prior sessions.
- Report unknowns clearly instead of inventing missing tools, skills, or project facts.
- Keep the response concise enough to be useful at session start.
- Always render the final response with `templates/prime-output.md`.
- The final output has two parts: project prime first, capabilities table last.

## Workflow

1. Always run both cookbooks in order:
   - `cookbook/bootstrap-workspace.md`
   - `cookbook/report-capabilities.md`
2. Do not skip either cookbook just because the user phrased the request as only "prime", "tools", "skills", "load context", or similar.
3. Use `templates/prime-output.md` to produce one cohesive report.
4. Keep the project section practical and the capabilities section table-based.

## Cookbook

### Session Prime

- IF: The user says `prime`, `/prime`, "start session", "bootstrap this repo", or similar session-start language.
- THEN: Run `cookbook/bootstrap-workspace.md`, then `cookbook/report-capabilities.md`.
- EXAMPLES:
  - "prime"
  - "/prime"
  - "start this session by loading the repo"
  - "bootstrap this workspace"
  - "load context for this repo"
  - "understand this workspace"
  - "what project are we in?"
  - "what tools do you have?"
  - "list available skills"
  - "show your capabilities"
  - "what connectors are enabled?"
