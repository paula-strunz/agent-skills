---
name: dev-lifecycle
description: Guide projects through pre-dev planning, active development, and post-dev documentation. Use when starting a new project, writing tickets, planning features/bugs/chores, implementing specs, reviewing changes, generating tests/prompts, writing PR descriptions, updating architecture docs, or creating case studies.
argument-hint: "[action] [details] e.g. 'write ticket for retry logic' or 'generate unit tests for auth module'"
---

# Purpose

A portable development lifecycle framework that guides a project from inception through active development to post-delivery documentation. Works in any repository by reading available project context at runtime.

## Variables

DOCS_ROOT: ./ai_docs
SCRATCHPAD_DIR: ./ai_docs/scratchpad
CORE_DOCS_DIR: ./ai_docs/core_docs
SPECS_DIR: ./specs

## Instructions

- Before executing any route, follow **Project Context Loading** from `references/shared-patterns.md`.
- Follow **Writing Style Rules** from `references/shared-patterns.md` for all generated output.
- Documentation artifacts save under `./ai_docs/` or `./specs/` per the **Save Path Convention** in `references/shared-patterns.md`. Runnable code artifacts such as tests follow project conventions unless the user gives an explicit path.
- Create directories as needed. Never assume they exist.
- Use `$ARGUMENTS` as the user's input to the selected route.
- **Scaling up:** If the request involves multiple routes or a large scope, first present a short execution sequence. Execute sequentially by default. If the runtime supports delegation and the user explicitly allows it, split independent routes across workers and merge the results.

## Recommended Lifecycle Order

Use this sequence when the user asks to start a project or generate multiple lifecycle documents. Skip steps that do not apply, and follow the user's requested route when they ask for a specific artifact.

1. **Project Charter:** Define why the project exists, who it serves, constraints, risks, and success criteria.
2. **PRD:** Translate the charter into personas, user journeys, requirements, priorities, and acceptance criteria.
3. **Architecture Design:** Decide the technical shape that can satisfy the PRD, including services, data flows, integrations, deployment, and trade-offs.
4. **Development Environment Guide:** Document local setup, repo structure, quality tools, CI/CD, and workflow once the stack and architecture are clear. Generate earlier for an existing repo or when setup is blocking.
5. **WBS:** Break the PRD and architecture into implementation phases, tasks, dependencies, and milestones.
6. **Tickets, Task Specs, and Work Plans:** Turn WBS items into executable work. Use tickets for planning, task specs for requirements clarity, and feature/bug/chore plans for researched implementation steps.
7. **Implementation:** Execute a plan or spec, then update tests, docs, and validation.
8. **Tests, Evals, and Review:** Generate or update verification, then review the change for regressions.
9. **PR Description:** Summarize branch changes after implementation and review.
10. **Post-Dev Updates:** Sync PRD, WBS, architecture, project charter, diagrams, and case studies with what was actually built.

## Workflow

1. Parse the user's request to identify the target phase and action.
2. Match to the correct cookbook route below.
3. Read and execute the matched cookbook file.
4. Validate output against the cookbook's requirements.

## Cookbook

### Phase 1: Pre-Dev (Project Definition and Planning)

Default sequence: charter, PRD, architecture, dev environment guide, WBS, tickets.

#### Generate Project Charter

- IF: The user wants to define a new project, establish vision, goals, and constraints.
- ORDER: First pre-dev document. Start here unless the user already has a clear charter-equivalent.
- THEN: Read and execute `cookbook/01-pre-dev/project-charter.md`.
- EXAMPLES:
  - "generate a project charter"
  - "help me define this new project"
  - "start a new project charter for the AI-powered service"

#### Generate PRD

- IF: The user wants to define product requirements, user personas, user journeys, and acceptance criteria.
- ORDER: Second pre-dev document. Use the charter as input when available.
- THEN: Read and execute `cookbook/01-pre-dev/prd.md`.
- EXAMPLES:
  - "generate a PRD"
  - "help me define the requirements for this feature"
  - "create product requirements"

#### Generate Architecture Design

- IF: The user wants to design system architecture, define services, data flows, and technical decisions.
- ORDER: Third pre-dev document. Use the PRD as input when available.
- THEN: Read and execute `cookbook/01-pre-dev/architecture-design.md`.
- EXAMPLES:
  - "design the system architecture"
  - "generate an architecture document"
  - "help me plan the technical architecture"

#### Generate Dev Environment Guide

- IF: The user wants to set up or document their development environment, tooling, CI/CD, or repo structure.
- ORDER: Fourth pre-dev document by default, after the stack and architecture are clear. Move earlier when setup is blocking.
- THEN: Read and execute `cookbook/01-pre-dev/dev-environment.md`.
- EXAMPLES:
  - "generate a dev environment guide"
  - "help me set up the development environment"
  - "document the dev setup"

#### Generate WBS

- IF: The user wants to create a work breakdown structure, sprint plan, or implementation roadmap.
- ORDER: Fifth pre-dev document by default. Use the PRD and architecture as input when available.
- THEN: Read and execute `cookbook/01-pre-dev/wbs.md`.
- EXAMPLES:
  - "generate a WBS"
  - "break down the implementation plan"
  - "create a work breakdown structure"

#### Write Ticket

- IF: The user wants to write a Kanban ticket, user story, or task description from notes or ideas.
- ORDER: After WBS for planned work, or anytime for an isolated task.
- THEN: Read and execute `cookbook/01-pre-dev/write-ticket.md`.
- EXAMPLES:
  - "write a ticket for adding retry logic"
  - "turn these notes into a ticket"
  - "create a Kanban card for this feature"

### Phase 2: Dev (Active Development)

Default sequence: task spec or work plan, implement plan, prompt if the work involves LLM behavior, tests and evals, PRD/WBS updates as reality changes, review, PR description.

#### Generate Task Spec

- IF: The user wants to create a detailed engineering specification for a specific task or feature.
- ORDER: First dev artifact for non-trivial work. Use before implementation.
- THEN: Read and execute `cookbook/02-dev/task-spec.md`.
- EXAMPLES:
  - "generate a spec for the caching layer"
  - "write a task specification"
  - "create an engineering spec for this feature"

#### Plan Feature Work

- IF: The user wants to plan a feature implementation from a ticket, rough feature request, or known task.
- ORDER: Use after a task spec when requirements are complex, or instead of a task spec when the request is already clear enough to plan.
- THEN: Read and execute `cookbook/02-dev/plan-feature.md`.
- EXAMPLES:
  - "plan feature ABC-123 add team invitations"
  - "create a feature plan for OAuth login"
  - "turn this feature ticket into an implementation plan"

#### Plan Bug Fix

- IF: The user wants to plan a bug fix, investigate symptoms, document root cause, or design regression coverage.
- ORDER: Use before implementation when the fix needs research or a reproducible path.
- THEN: Read and execute `cookbook/02-dev/plan-bug.md`.
- EXAMPLES:
  - "plan bug fix for failed checkout retries"
  - "create a bug plan for this stack trace"
  - "investigate and plan a fix for ABC-456"

#### Plan Chore Work

- IF: The user wants to plan maintenance work such as refactors, dependency updates, cleanup, docs sync, or tooling changes.
- ORDER: Use before implementation when maintenance scope needs boundaries.
- THEN: Read and execute `cookbook/02-dev/plan-chore.md`.
- EXAMPLES:
  - "plan chore update dependencies"
  - "create a chore plan for replacing the lint config"
  - "plan repository cleanup"

#### Implement Plan

- IF: The user wants to implement an existing plan, task spec, or file under `specs/`.
- ORDER: After task spec or work plan.
- THEN: Read and execute `cookbook/02-dev/implement-plan.md`.
- EXAMPLES:
  - "implement specs/ABC-123-add-cache/ABC-123-feature-plan.md"
  - "implement this plan"
  - "execute the task spec for ABC-123"

#### Generate Prompt

- IF: The user wants to create a structured LLM prompt template.
- ORDER: After task spec when the work involves LLM behavior, or anytime a prompt is the main deliverable.
- THEN: Read and execute `cookbook/02-dev/generate-prompt.md`.
- EXAMPLES:
  - "generate a prompt for document classification"
  - "create an LLM prompt template"
  - "write a structured prompt for this use case"

#### Generate Unit Tests

- IF: The user wants to generate unit tests for specific code.
- ORDER: During implementation or immediately after a code slice exists.
- THEN: Read and execute `cookbook/02-dev/unit-tests.md`.
- EXAMPLES:
  - "generate unit tests for the auth module"
  - "write tests for this function"
  - "create unit tests for the parser"

#### Generate E2E Tests

- IF: The user wants to generate end-to-end tests covering full user journeys or system flows.
- ORDER: After the end-to-end flow or integration path is defined.
- THEN: Read and execute `cookbook/02-dev/e2e-tests.md`.
- EXAMPLES:
  - "generate e2e tests for the checkout flow"
  - "write end-to-end tests for the API"
  - "create integration tests for the full pipeline"

#### Generate Evals

- IF: The user wants to create evaluation test suites for LLM features, prompt quality, or AI accuracy.
- ORDER: After prompt or AI pipeline behavior is defined.
- THEN: Read and execute `cookbook/02-dev/evals.md`.
- EXAMPLES:
  - "generate evals for the summarization prompt"
  - "create evaluation tests for the classifier"
  - "write accuracy evals for the extraction pipeline"

#### Update PRD

- IF: The user wants to update the product requirements document based on development learnings or scope changes.
- ORDER: During dev when implementation changes product behavior, acceptance criteria, or scope.
- THEN: Read and execute `cookbook/02-dev/update-prd.md`.
- EXAMPLES:
  - "update the PRD based on what we built"
  - "sync the requirements with implementation"
  - "update PRD from recent WBS changes"

#### Update WBS

- IF: The user wants to update the work breakdown structure based on git history, completed work, or new tasks.
- ORDER: During dev after meaningful commits, sprint changes, or task discoveries.
- THEN: Read and execute `cookbook/02-dev/update-wbs.md`.
- EXAMPLES:
  - "update the WBS from recent commits"
  - "sync the WBS with what's been done"
  - "update the work breakdown from last 20 commits"

#### Review Change

- IF: The user wants to review a branch, PR, patch, local diff, or specific files for correctness risks.
- ORDER: After implementation and tests, before PR description or merge.
- THEN: Read and execute `cookbook/02-dev/review-change.md`.
- EXAMPLES:
  - "review current diff"
  - "review PR 123"
  - "review this patch for regressions"

#### Respond to Review

- IF: The user wants to evaluate, respond to, or fix comments from a code review (human, AI agent, or automated).
- ORDER: After a review has been received, before posting replies or merging.
- THEN: Read and execute `cookbook/02-dev/respond-to-review.md`.
- EXAMPLES:
  - "respond to review comments on PR 123"
  - "review the comments to your code"
  - "address the copilot review"
  - "evaluate these review comments specs/review.md"

#### Write PR Description

- IF: The user wants to generate a pull request title and description from a branch diff.
- ORDER: Final dev artifact after implementation, verification, and review.
- THEN: Read and execute `cookbook/02-dev/write-pr-description.md`.
- EXAMPLES:
  - "write a PR description for this branch"
  - "generate a PR description"
  - "write PR description for feature/1234/add-caching"

### Phase 3: Post-Dev (Documentation and Retrospective)

Default sequence: update architecture, update project charter, generate data flow diagrams, then write the case study.

#### Update Architecture Document

- IF: The user wants to update the architecture design document to reflect actual implementation.
- ORDER: First post-dev document. Make the technical record accurate before deriving diagrams or retrospectives.
- THEN: Read and execute `cookbook/03-post-dev/update-architecture.md`.
- EXAMPLES:
  - "update the architecture document"
  - "sync the ADD with the current codebase"
  - "update architecture based on what changed"

#### Update Project Charter

- IF: The user wants to update the project charter based on delivered outcomes vs original plans.
- ORDER: Second post-dev document. Use the updated PRD, WBS, and architecture as evidence.
- THEN: Read and execute `cookbook/03-post-dev/update-project-charter.md`.
- EXAMPLES:
  - "update the project charter"
  - "reflect on project outcomes in the charter"
  - "update charter with actual business results"

#### Generate Data Flow Diagrams

- IF: The user wants to generate interactive data flow diagrams as a standalone HTML page with Mermaid.js.
- ORDER: Third post-dev artifact. Generate after the architecture document reflects reality.
- THEN: Read and execute `cookbook/03-post-dev/data-flow-diagrams.md`.
- EXAMPLES:
  - "generate data flow diagrams"
  - "create architecture diagrams for the codebase"
  - "visualize the data flows as an HTML page"

#### Generate Case Study

- IF: The user wants to create a case study documenting project outcomes, learnings, and impact.
- ORDER: Final post-dev artifact. Use the updated docs, diagrams, and outcomes as source material.
- THEN: Read and execute `cookbook/03-post-dev/case-study.md`.
- EXAMPLES:
  - "generate a case study for this project"
  - "write up the project outcomes"
  - "create a case study documenting what we built"

## Resource Map

- `cookbook/01-pre-dev/`: 6 cookbooks for project definition and planning
- `cookbook/02-dev/`: 14 cookbooks for active development
- `cookbook/03-post-dev/`: 4 cookbooks for documentation and retrospective
- `references/shared-patterns.md`: DRY patterns (scratchpad, consultation, writing style, save paths, **frontmatter convention**)
- `references/work-planning.md`: reusable feature, bug, chore, implementation, and review formats
- `templates/ticket.md`: Kanban ticket output template
- `templates/pr-description.md`: PR description output template
- `templates/epic.md`: Optional epic output template when the project tracks epics
- `checklists/quality-gate.md`: Output quality checks

When a project provides its own document schema, routing rules, or templates, use those as the authority. See **Frontmatter Convention** and **Workspace-Specific Routing** in `references/shared-patterns.md`.

## Output Contract

- One final artifact or coherent artifact set per invocation, saved to the path defined by the cookbook
- All output follows Writing Style Rules from shared-patterns.md
- Documentation paths live under `./ai_docs/` or `./specs/` unless project-specific routing says otherwise
- Runnable tests, evals, and prompts follow the project's source/test conventions when the cookbook says so
- Iterative consultation routes may also maintain a scratchpad under `./ai_docs/scratchpad/`
