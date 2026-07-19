# Work Planning Patterns

Use these patterns for execution plans that turn a known ticket, bug, chore, or feature request into concrete implementation work.

## Shared Work Planning Pattern

1. Load project context using the Project Context Loading pattern from `shared-patterns.md`.
2. Resolve `task-id` and `short-description` from the input, branch name, ticket text, or user-provided context. If no task ID exists, use a descriptive slug.
3. Research the codebase before writing the plan. Inspect existing patterns, relevant modules, tests, dependency manifests, task runners, CI config, and docs.
4. Derive relevant files from the repository. Do not reuse hardcoded file lists from another project.
5. Keep the plan surgical. Scope the smallest coherent change that solves the request.
6. Include validation commands based on the project, such as package scripts, task runner commands, lint, typecheck, unit tests, integration tests, and reproduction commands.
7. If a new dependency is needed, use the project's package manager and record the rationale in Notes.
8. Replace every placeholder in the selected format. Leave no generic filler.

## Feature Plan Format

```md
# Feature: <feature name>

## Feature Description
<describe the feature, its purpose, and the value it creates>

## User Story
As a <type of user>
I want to <action or goal>
So that <benefit or value>

## Problem Statement
<define the specific problem or opportunity>

## Solution Statement
<describe the proposed solution and why it fits this codebase>

## Relevant Files
Use these files to implement the feature:

- `<path>`: <why this file matters>

### New Files
- `<path>`: <why this file is needed>

## Implementation Plan

### Phase 1: Foundation
<foundational work needed before core implementation>

### Phase 2: Core Implementation
<main implementation work>

### Phase 3: Integration
<how the feature connects to existing components>

## Step by Step Tasks

### 1. <task name>
- <specific action>
- <specific action>

## Testing Strategy

### Unit Tests
<unit tests needed>

### Integration or E2E Tests
<integration or end-to-end tests needed>

### Edge Cases
<edge cases to verify>

## Acceptance Criteria
- [ ] <measurable criterion>

## Validation Commands
- `<command>`: <what this validates>

## Notes
<dependencies, trade-offs, follow-ups, or N/A>
```

## Bug Plan Format

```md
# Bug: <bug name>

## Bug Description
<symptoms, expected behavior, actual behavior, and affected users or systems>

## Problem Statement
<specific defect to solve>

## Solution Statement
<proposed fix and why it addresses the root cause>

## Steps to Reproduce
1. <step>
2. <step>

## Root Cause Analysis
<evidence-backed root cause, including relevant files or flows>

## Relevant Files
Use these files to fix the bug:

- `<path>`: <why this file matters>

### New Files
- `<path>`: <why this file is needed>

## Step by Step Tasks

### 1. <task name>
- <specific action>
- <specific action>

## Regression Tests
- <test that fails before the fix and passes after>

## Validation Commands
- `<command>`: <what this validates>

## Notes
<dependencies, trade-offs, follow-ups, or N/A>
```

## Chore Plan Format

```md
# Chore: <chore name>

## Chore Description
<describe the maintenance work and why it matters>

## Scope
<what is included and explicitly excluded>

## Relevant Files
Use these files to complete the chore:

- `<path>`: <why this file matters>

### New Files
- `<path>`: <why this file is needed>

## Step by Step Tasks

### 1. <task name>
- <specific action>
- <specific action>

## Validation Commands
- `<command>`: <what this validates>

## Notes
<dependencies, trade-offs, follow-ups, or N/A>
```

## Implementation Report Format

```md
## Summary
- <completed change>

## Files Changed
- `<path>`: <what changed>

## Validation
- `<command>`: <result>

## Notes
<follow-ups, limitations, or N/A>
```

## Review Response Format

Evaluate each review comment against the actual code. Present as a table.

```md
| # | File:Line | Comment (summary) | Valid? | Reasoning | Proposed Fix | Proposed Reply |
|---|-----------|-------------------|--------|-----------|-------------|----------------|
| 1 | `path:line` | <reviewer's point> | Yes/Partial/No | <why, grounded in code> | <change or N/A> | <reply text> |
```

After the table, list:
- **Ready to fix**: comment numbers the user approved.
- **Commit message**: conventional-commit message covering all applied fixes.
- **Replies to post**: comment numbers with approved reply text (PR source only).

## Review Output Format

Findings come first, ordered by severity.

```md
## Findings
- **High** `<path>:<line>`: <issue and impact>
- **Medium** `<path>:<line>`: <issue and impact>
- **Low** `<path>:<line>`: <issue and impact>

## Open Questions
- <question or N/A>

## Test Gaps
- <gap or N/A>

## Summary
<short description of reviewed scope>
```
