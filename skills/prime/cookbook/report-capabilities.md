# Report Capabilities

Report the agent capabilities that are visible in the current runtime.

## Steps

1. List built-in development capabilities that are available in the current agent environment:
   - filesystem reads and edits
   - shell execution
   - patch application
   - planning or task tracking
   - image viewing or generation
   - browser, web, or research access
   - subagents or parallel execution, if available

   When the runtime exposes concrete tool names (e.g. Claude Code surfaces `Read`, `Edit`, `Bash`, `Grep`, `TaskCreate`, `Agent`; Codex surfaces `apply_patch`, `shell`, etc.), list them by name alongside the category. Fall back to generic category labels only when no concrete names are visible.
2. List available skills:
   - Start with skills visible in the current session context.
   - If local skill folders exist, inspect direct children of likely skill roots such as `.agents/skills`, `.codex/skills`, `.claude/skills`, and `skills`.
   - Read only `SKILL.md` frontmatter unless more detail is needed for the user's request.
3. List enabled plugins or app connectors when visible.
4. Mention MCP resources or connector tools only when they are visible or discoverable in this runtime.
5. Clearly mark anything that is unknown, unavailable, or runtime-specific.

## Data To Collect

Collect enough information to fill the Capabilities table in `templates/prime-output.md`.

For each capability, capture:

- type: built-in tool, skill, plugin, connector, MCP/app, browser/web, image, subagent, or limit
- title: the capability name
- use for: one short phrase explaining practical use

Do not invent TypeScript function signatures unless the user explicitly asks for schemas. Prefer concrete tool names when the runtime exposes them; otherwise fall back to practical capability names over raw implementation details.
