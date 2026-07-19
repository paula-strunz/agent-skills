# Ticket Template

Use this template for generating Kanban tickets. Fill in all bracketed placeholders.

```markdown
## Description

**AS:** [Pick the role most relevant to the work, e.g., Developer, Engineer, Designer, Analyst, Data Scientist, etc.]

**I WANT TO:** [Clear, short goal. One or two sentences max.]

**SO THAT:** [Concrete outcome. What changes or becomes possible after completion.]

## Business Value

[One to three sentences. Why does this matter? Be specific.]

## Acceptance Criteria

- [ ] [Criterion 1 - concise, testable, one line]
- [ ] [Criterion 2 - concise, testable, one line]
- [ ] [Criterion 3 - concise, testable, one line]

## Linked Goal

[Link to relevant goal, OKR, epic, or initiative. Write "N/A" if none.]

## Additional Content

[Include any relevant details: examples, file paths, technical constraints, edge cases. Write "N/A" if nothing extra is needed.]
```

## Rules for filling this template

- **Be concise.** A developer should understand the full scope in under 2 minutes.
- **Be specific.** Reference actual file paths, module names, or components when relevant (derive from the codebase).
- **Acceptance criteria must be testable.** Each is one short line. 3-5 items max. Each is verifiable as done or not done.
- **Do not invent requirements** not present in the input. If ambiguous, ask.
