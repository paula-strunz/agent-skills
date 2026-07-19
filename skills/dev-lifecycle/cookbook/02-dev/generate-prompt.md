# Generate LLM Prompt

## Purpose

Create a structured, reusable LLM prompt for a given use case. The prompt follows XML-based structure with clear role definitions, task flows, examples, output formatting, and guardrails. Produces production-quality prompts that minimize ambiguity and maximize output quality.

## Inputs

- `$ARGUMENTS`: Description of the use case the prompt should address
- Save location specified by user, or ask for the target path

## Process

1. **Load project context.**
   Follow **Project Context Loading** from `references/shared-patterns.md`. Use the project context to make the prompt specific to the project's needs.

2. **Analyze the Requirements**
   - What specific task should the LLM perform?
   - What inputs will it receive?
   - What outputs are expected?
   - What constraints or guardrails are needed?

3. **Define the Role Component**
   - What expertise should the LLM embody?
   - What domain knowledge is required?
   - What professional perspective should it take?

4. **Structure the Purpose**
   - Main objective statement
   - Analytical framework with numbered categories
   - Specific capabilities and deliverables

5. **Design the Task Flow**
   - Break down into clear, numbered steps
   - Include validation and quality checks
   - Make each step actionable and measurable

6. **Create Comprehensive Examples**
   - Basic positive cases
   - Edge cases with context
   - Invalid input scenarios
   - Progress from simple to complex

7. **Define Output Format**
   - Strict formatting requirements
   - Field-by-field specifications
   - Validation rules and constraints

8. **Add Guardrails**
   - Format compliance rules
   - Quality assurance checks
   - Scope limitations
   - Safety considerations

## Output

Generate a complete prompt following the XML template structure that:

- Uses clear `<role>`, `<purpose>`, `<task_description>` tags
- Includes relevant `<examples>` covering various scenarios
- Specifies exact `<output_format>` with validation rules
- Contains appropriate `<guardrails>` for quality control
- Uses `{{variable_name}}` placeholders for runtime values

Include frontmatter metadata when the project uses frontmatter or prompt metadata:

```yaml
---
description: [Brief description of what this prompt does]
author: [Author name or "AI-Generated"]
version: 1.0.0
tags: [relevant, tags, for, categorization]
---
```

Save the prompt to the location specified by the user. If no location is specified, ask for the target path.

## Rules

- Follow the Writing Style Rules from shared-patterns.md.
- The goal is to create a reusable, well-structured prompt that minimizes ambiguity and maximizes output quality.
- Use `{{variable_name}}` syntax for all runtime values.
- Every example should demonstrate a distinct scenario, not just variations of the same case.
