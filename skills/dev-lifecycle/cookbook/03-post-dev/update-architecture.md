# Purpose

Read the current Architecture Design Document (ADD), analyze the codebase to detect architectural patterns and changes since the ADD was last written, consult with the user to understand decisions, and update the ADD to reflect actual implementation. Evidence-based, no assumptions.

## Inputs

- `$ARGUMENTS`: Specific areas to focus on (e.g., "new caching layer", "auth service extraction"), or empty to scan everything.

## Process

### 1. Load project context

Follow **Project Context Loading** from `shared-patterns.md` to understand the project's source directory structure, tech stack, dependency management, and conventions.

### 2. Read the current ADD

Read the existing ADD from `./ai_docs/core_docs/add.md`. If none exists, inform the user and offer to generate one from scratch using the pre-dev architecture cookbook instead.

### 3. Scan project structure

Explore the project's source directories, deriving likely paths from project context and repo structure, to detect:
- New services, modules, or packages not documented in the ADD
- Configuration files revealing architecture (Docker Compose, Kubernetes manifests, serverless configs, CI/CD pipelines)
- API definitions (routers, endpoints, controllers, route handlers)
- Entry points and their wiring

Use available file search tools to scan. Do not hardcode directory names or paths.

### 4. Analyze dependencies

Read the project's dependency file (could be `pyproject.toml`, `requirements.txt`, `package.json`, `go.mod`, `Cargo.toml`, `build.gradle`, or similar) and look for:
- Architectural dependencies: message queues, caches, task runners, web frameworks, ORMs
- Database technologies: SQL clients, document stores, key-value stores
- External service integrations: cloud SDKs, payment providers, email services, monitoring tools

Compare what the dependency file shows against what the ADD documents.

### 5. Detect design patterns

Scan the codebase for patterns that may not be in the ADD:
- Repository pattern, service layer, event-driven patterns
- Caching implementations (decorators, middleware, explicit cache calls)
- Pub/sub, event emitters, message handlers
- Middleware chains, interceptors, decorators
- Factory functions, dependency injection

### 6. Interactive consultation

Based on evidence from steps 3-5, ask the user targeted questions. Follow the Iterative Consultation Pattern from `shared-patterns.md`. Use the Scratchpad Pattern to persist state at `./ai_docs/scratchpad/add_update_scratchpad.md`.

Question categories:

**Service architecture**: "I found directories X, Y, Z that aren't in the ADD. Are these separate services or internal modules?" / "Service A imports from B frequently. Is this a direct dependency or should there be a message boundary?"

**Technology stack evolution**: "Redis appears in dependencies but not in the ADD. What role does it serve?" / "I see task worker definitions. What async tasks are being processed?"

**Integration patterns**: "Found webhook endpoints. Which external services are integrated?" / "OAuth implementation detected. Which providers?"

**Performance and scale**: "Connection pooling configured. What load are you designing for?" / "Caching decorators on many methods. What performance issues prompted this?"

**Security architecture**: "Auth implementation differs from ADD. What changed?" / "Found encryption utilities. What data requires encryption at rest?"

### 7. Update the ADD

Follow the Writing Style Rules from `shared-patterns.md`. Structure updates as:

```markdown
## Section Name [EVOLVED]
**Original Design**: [preserved from original ADD]
**Current Implementation**: [what the code actually shows]
**Evolution Rationale**: [from user consultation]
**Evidence**: [specific files, line references]
```

For technology stack changes, use a comparison table:

```markdown
| Component | Original | Current | Reason |
|-----------|----------|---------|--------|
| Cache | None | Redis | Found in dependencies, used in service_x.py |
```

### 8. Validate with user

Before finalizing, confirm the updated ADD with the user. Adjust specific sections without regenerating the full document.

## Key Instructions

1. **Evidence-based updates**: Link every change to specific files or code
2. **Ask, do not assume**: Verify interpretations with the user
3. **Preserve history**: Show evolution (original vs current), not just final state
4. **Focus on architecture**: Components, boundaries, and data flow. Not implementation details.
5. **Document the why**: Rationale matters more than what changed

## Output

Update the ADD in place at `./ai_docs/core_docs/add.md`. Preserve the original design with clear annotations showing what evolved and why. The ADD should help new developers understand both the system's current structure and how it got there.
