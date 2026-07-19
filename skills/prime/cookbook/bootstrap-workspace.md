# Bootstrap Workspace

Load enough local context to work safely in the current workspace.

## Steps

1. Identify the workspace root:
   - Use `pwd`.
   - List the top-level files and directories.
   - Check whether the directory is a git repo. If it is not, say so without trying to initialize one. If it is, capture current state with `git status --short`, `git branch --show-current`, and `git log --oneline -n 10`.
2. Read local instruction files when present:
   - `AGENTS.md`
   - `CLAUDE.md`
   - `README.md`
   - `README-*`
   - `EPICS.md`, `ROADMAP.md`, `TODO.md` (roadmap-style roots)
   - `.agents/`, `.codex/`, `.claude/`, or other runtime folders only when needed for current context.
3. List (do not read) common docs roots when present, so docs are discoverable without burning context:
   - `ai_docs/`, `docs/`, `documentation/`, `specs/`
   - Surface a compact tree in the prime output. Load specific files only when the user's task requires them.
4. Inspect project metadata when present:
   - `pyproject.toml`
   - `package.json`
   - `uv.lock`
   - `pnpm-lock.yaml`, `package-lock.json`, or `yarn.lock`
   - `Cargo.toml`, `go.mod`, `pom.xml`, or similar stack files
5. Detect the workspace shape:
   - single repo
   - monorepo
   - docs or knowledge repo
   - multi-repo umbrella
   - PersonalOS-style content/business/personal workspace
6. Identify likely operating rules:
   - package manager and test commands
   - important scripts
   - content or file-naming conventions
   - private or generated areas to avoid touching
   - repo-specific safety constraints

## Data To Collect

Collect enough information to fill the Project Prime section of `templates/prime-output.md`:

- workspace root
- workspace shape
- git/repo state
- project purpose and intent
- major directories and what they do
- compact file tree or structure map
- key instruction files loaded
- project docs loaded
- runtime folders inspected
- metadata files inspected
- toolchain and common commands, if discoverable
- file or content conventions
- important constraints and things to avoid
- current work signals, if discoverable from docs or obvious project state
- unknowns that matter before making changes

Do not dump file contents. Prefer a compact interpretation over exhaustive detail.
