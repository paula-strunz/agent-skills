# Shared Patterns

Reusable patterns referenced by all cookbook files. Cookbook authors: reference these by name instead of duplicating them.

## Scratchpad Pattern

For any iterative consultation workflow, maintain a scratchpad file to persist conversation state across session interruptions.

**How to use:**
- Create the scratchpad at the path specified by the cookbook (always under `./ai_docs/scratchpad/`)
- After every user response, update it with compact bullet points capturing the discussion
- The scratchpad is a persisted cache, not a replacement for the final document
- If a prior scratchpad exists, read it first and resume from where the last session left off
- Keep it minimal: precise bullet points or short phrases, low token count

## Iterative Consultation Pattern

Used by all "generate" commands that produce core documents (project charter, PRD, architecture design, WBS, dev environment guide).

**Flow:**
1. Load project context using the Project Context Loading pattern
2. Ask open-ended questions to explore the requirements space
3. Follow up on answers to clarify ambiguities
4. Maintain a mental graph of the requirements and their interconnections
5. Traverse the graph, moving between high-level and granular topics
6. Use the Scratchpad Pattern to persist state
7. Do NOT generate the final document until all aspects have been explored
8. Confirm with the user before generating the final output
9. After generating, engage in refinement - adjust specific aspects without regenerating the full document

## Writing Style Rules

All output from every cookbook must follow these rules:

- No em dash character. Use commas, periods, parentheses, or a normal hyphen where appropriate.
- No "is not X, is Y" constructions. State things directly.
- No filler: avoid "it's worth noting", "importantly", "crucially", "leverage", "delve into".
- Concise, not verbose. Every sentence carries information. If you can cut it and the meaning survives, cut it.
- Still clear. Everything must be understandable by someone reading it for the first time.
- Natural flow. Write the way a senior engineer talks in a PR review. Direct, specific, no fluff.
- Output in English regardless of input language.

## Save Path Convention

Generated documentation artifacts go under `./ai_docs/` or `./specs/` in the current working directory. Runnable code artifacts follow project conventions unless the user gives an explicit path.

| Artifact type | Path pattern |
|---|---|
| Core docs (charter, PRD, ADD, WBS) | `./ai_docs/core_docs/<document_name>.md` |
| Specs | `./specs/<task-id>-<short-description>/<filename>.md` |
| Work plans | `./specs/<task-id>-<short-description>/<task-id>-<work-type>-plan.md` |
| Tickets | `./specs/<task-id>-<short-description>/<task-id>-ticket-<short-description>.md` |
| PR descriptions | `./specs/<task-id>-<short-description>/<task-id>-pr-description.md` |
| Case studies | `./ai_docs/case_studies/<project_name>_case_study.md` |
| Data flow diagrams | `./ai_docs/docs/data-flows.html` |
| Scratchpads | `./ai_docs/scratchpad/<document_name>_scratchpad.md` |
| Prompts | Save location specified by user, or ask |
| Tests | Save location specified by user, or follow project test conventions |
| Dev environment guide | `./ai_docs/core_docs/dev_environment_guide.md` |

Always create directories if they do not exist.

### Workspace-Specific Routing

Use project-provided routing rules when they exist. Common sources include `AGENTS.md`, `README.md`, `CONTRIBUTING.md`, `docs/`, `ai_docs/_templates/`, or a workspace governance file.

| Artifact scope | Save location |
|---|---|
| Single-repo work | Current repo's `ai_docs/` or `specs/` |
| Monorepo package work | Package-local `ai_docs/` or `specs/` when that convention already exists, otherwise workspace-level `ai_docs/` or `specs/` |
| Cross-repo or cross-package work | Workspace-level `ai_docs/` or `specs/` |
| Runnable tests and evals | Project test directories |
| Prompt files | User-specified path or existing prompt directory |

When routing is ambiguous, state the assumption before writing. Do not create new top-level documentation systems unless the user asks.

## Frontmatter Convention

Use frontmatter only when the project already uses it, when a project schema exists, or when the generated document is a durable lifecycle artifact under `ai_docs/` or `specs/`.

Project-specific schemas override these defaults. Look for `ai_docs/_templates/frontmatter.md`, `docs/_templates/frontmatter.md`, existing documents with frontmatter, or explicit instructions in project guidance files.

Default portable fields for lifecycle docs: `title`, `type`, `status`, `created`, `updated`. Recommended when known: `scope`, `owners`, `tags`, `related`.

Suggested `type` values: `charter`, `prd`, `architecture`, `roadmap`, `wbs`, `spec`, `adr`, `design`, `overview`, `glossary`, `status`, `case-study`.

Every cookbook that generates a durable markdown document must:

1. Follow the project schema if one exists.
2. Fill in dates from the current date.
3. Never fabricate owners, epic IDs, repo names, or links. Omit optional fields when values are unknown.

If the project uses Obsidian-style wikilinks, write them as `[[path/to/doc]]` without the `.md` extension, quoted inside YAML.

## Project Context Loading

Every cookbook that needs project understanding must start with:

1. Read available project guidance files in this order when present: `AGENTS.md`, `AGENTS.local.md`, `CLAUDE.md`, `CLAUDE.local.md`, `README.md`, `CONTRIBUTING.md`, docs under `docs/`, and existing lifecycle docs under `ai_docs/core_docs/`. `.local.md` variants override or extend the canonical files when present.
2. Use this context to make output specific and actionable (reference real file paths, module names, technology choices).
3. If guidance files are missing, infer context from repo layout, dependency manifests, source directories, tests, and recent git history when relevant.
4. Do not hardcode project-specific details in the cookbook itself. Always derive them from the project files at runtime.
