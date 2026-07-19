# Prime Report

## Project Prime

### What This Is

Write 2-4 short bullets that explain the project in plain language:

- what the workspace/repo is
- what it is trying to accomplish
- who or what it appears to serve
- the most important context loaded for this session

### Workspace Map

```text
<compact tree or structure map, max ~20 lines>
```

After the tree, add 3-7 bullets explaining the important directories or files. Keep this interpretive, not exhaustive.

### Loaded Context

| Type | Path | What It Tells Me |
|---|---|---|
| Instructions | `AGENTS.md` | <repo rules, workflow constraints, or source-of-truth notes> |
| Docs | `README.md` | <project purpose or usage notes> |
| Metadata | `pyproject.toml` | <tooling/package hints> |

Include only files actually found or inspected. Remove rows that do not apply.

### Docs Index (discoverable, not loaded)

When `ai_docs/`, `docs/`, `documentation/`, or `specs/` exist, surface a compact tree so the docs are discoverable. Do not load file contents at prime time; pull specific files only when a task requires them.

```text
<compact tree of docs roots, max ~20 lines; collapse subdirectories with file counts>
```

Omit this section entirely when no docs roots are present.

### How To Work Here

- Commands: <test/build/dev/setup commands, if discoverable>
- Conventions: <file naming, content structure, code style, or workflow rules>
- Safety: <private areas, generated files, git constraints, destructive actions to avoid>
- Current signals: <work in progress, roadmap, TODOs, untracked state, or obvious next context, if discoverable>

### Open Questions

- <unknowns that matter before making changes>
- If there are no important unknowns, write: `No blocking unknowns from the prime pass.`

## Available Capabilities

| Type | Title | Use For |
|---|---|---|
| Built-in tool | `Read`, `Edit`, `Write` (or harness equivalent) | Inspect and modify local files in the workspace |
| Built-in tool | `Bash` (or harness equivalent) | Run repo commands, tests, searches, and local scripts |
| Skill | `<skill-name>` | <what this skill is useful for> |
| Plugin/connector | `<plugin-name>` | <what this connector enables> |
| Limit | `<limit or unknown>` | <what is unavailable or not visible in this runtime> |

Use concrete tool names when the runtime exposes them (Claude Code: `Read`, `Edit`, `Bash`, `Grep`, `TaskCreate`, `Agent`; Codex: `apply_patch`, `shell`). Fall back to generic category labels ("Filesystem read/edit", "Shell execution") only when no concrete names are visible.

Group related rows together when possible. Keep each `Use For` cell short enough to scan.

## Ready State

One short sentence stating what context is now loaded and what the agent is ready to do next.
