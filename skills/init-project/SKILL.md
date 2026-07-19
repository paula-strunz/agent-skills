---
name: init-project
description: Scaffold a new local project workspace with git, agent skill links, core docs folders, README, and a Node-oriented .gitignore. Use when starting a fresh repo or asking to initialize project structure without pushing to a remote.
---

# Skill: init-project

Scaffold a new project from scratch in the current working directory.

## Steps

1. **Git init**
   ```bash
   git init
   ```

2. **Create folder structure**
   ```bash
   mkdir -p ai_docs/core_docs
   ```

3. **Wire up skills from the central skills repo** (single source of truth —
   see `~/repos/claude-skills`). This creates `.claude/`, `.agents/`, and
   `.codex/` and symlinks `skills/` in each of them to the central repo, so
   every skill is available immediately with zero copying.
   ```bash
   ~/repos/claude-skills/install.sh "$(pwd)"
   ```

4. **Move any existing PRD or docs** into `ai_docs/core_docs/` if present.

5. **Create a minimal README.md**
   - Project name as title
   - One-line description
   - `npm install` / `npm run dev` getting-started block
   - Note that docs live in `ai_docs/core_docs/`

6. **Create `.gitignore`** for a Node.js project with clear sections:
   - Dependencies (`node_modules/`)
   - Build output (`dist/`, `build/`, `out/`, `.next/`, `.nuxt/`, `.output/`)
   - Environment & secrets (`.env`, `.env.*`, keep `.env.example`)
   - Logs
   - Runtime & cache (`.cache/`, `.turbo/`, `*.tsbuildinfo`)
   - Testing (`coverage/`)
   - OS (`.DS_Store`, `Thumbs.db`)
   - Editors (`.vscode/`, `.idea/`)
   - Claude / AI tooling (`.claude/settings.local.json`)

## Result structure

```
<project>/
├── .agents/
│   └── skills -> ~/repos/claude-skills/skills
├── .claude/
│   └── skills -> ~/repos/claude-skills/skills
├── .codex/
│   └── skills -> ~/repos/claude-skills/skills
├── ai_docs/
│   └── core_docs/            ← PRD and core docs
├── .gitignore
└── README.md
```

## Notes

- `core_docs` = "car" as in the vehicle — this is the naming convention.
- Do not create a CLAUDE.md at this stage; that comes later once the stack is defined.
- Do not push to any remote; this is local-only scaffolding.
