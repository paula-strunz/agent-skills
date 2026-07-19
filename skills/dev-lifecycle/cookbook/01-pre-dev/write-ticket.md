# Write Ticket

## Purpose

Generate a clear, actionable Kanban ticket from rough input (messy notes, a description, or a task ID). Produces a structured ticket that a developer can understand in under 2 minutes.

Lifecycle position: after WBS for planned project work, or anytime for an isolated task.

## Inputs

- `$ARGUMENTS` - A ticket description, messy notes, rough idea, or task ID. Can be in any language.

## Process

1. **Load project context.** Follow **Project Context Loading** from `references/shared-patterns.md`.

2. **Resolve task-id and short-description first.** Check the input for a task ID (e.g. `1234`) and a short kebab-case description (e.g. `add-retry-logic`). If either is missing, prompt the user immediately. Do not proceed until both are known.

3. **Parse the input carefully.** The input may be messy, incomplete, or in any language. Extract the core intent, technical details, and acceptance criteria from whatever is provided.

4. **Ask clarifying questions** if critical information is missing (e.g., which role this targets, what the expected output is, or which part of the codebase is affected). Keep questions concise and grouped. Skip this step if the input is clear enough.

5. **Generate the ticket** using the template below. Be concise and developer-friendly. Every sentence should carry information.

## Template

```
## Description

**AS:** [Pick the role most relevant to the work (e.g., Developer, Engineer, Designer, Analyst, Data Scientist, AI Engineer, etc.). Default to the role that best matches the nature of the task.]

**I WANT TO:** [Clear, short goal. One or two sentences max.]

**SO THAT:** [Concrete outcome. What changes or becomes possible after completion.]

## Business Value

[One to three sentences. Why does this matter to the business? Be specific.]

## Acceptance Criteria

- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

## Linked Goal

[Link to relevant goal, OKR, epic, or initiative, or write "N/A"]

## Additional Content

[Include any relevant details from the input: examples, screenshot references, file paths, technical constraints, edge cases. If nothing extra is needed, write "N/A".]
```

## Rules

- **Be concise.** A developer should understand the full scope in under 2 minutes of reading.
- **Be specific.** Reference actual file paths, module names, or components from the codebase when relevant (derived from project context at runtime).
- **Acceptance criteria must be concise and testable.** Each criterion is one short line. No sub-bullets, no explanation. 3-5 items max. Each item is verifiable as done or not done. If the deliverable is a doc or a script, say so directly (e.g. "A script exists at `path/to/script.py` that does X").
- **Pick the right role** for the "AS" field based on the nature of the work.
- **Do not invent requirements** that were not in the input. If something is ambiguous, ask.
- **Output only the ticket.** No preamble, no explanation around it.

## Output

Save the ticket to:

```
./specs/<task-id>-<short-description>/<task-id>-ticket-<short-description>.md
```

Create the directory if it does not exist. Use the task-id and short-description resolved in step 2.

## Style

Follow **Writing Style Rules** from `references/shared-patterns.md`.
