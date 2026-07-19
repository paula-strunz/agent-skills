# Product Requirements Document (PRD)

## Purpose

Guide an iterative consultation to help the user transform business objectives into clear, actionable product requirements. The output is a comprehensive PRD covering personas, user journeys, functional/non-functional requirements, and acceptance criteria.

Lifecycle position: second planning document. Use the project charter as input when available.

## Inputs

- `$ARGUMENTS` - Optional context: feature name, rough requirements, or area to explore. If empty, start from scratch.

## Process

1. **Load project context.** Follow **Project Context Loading** from `references/shared-patterns.md`.

2. **Follow the Iterative Consultation Pattern** from `references/shared-patterns.md`. Scratchpad path: `./ai_docs/scratchpad/prd_scratchpad.md`

3. **Explore these dimensions** through conversation:
   - **Product Overview:** Core functionality and purpose in clear, concise terms
   - **User Personas:** Primary user types, their goals, pain points, and technical capabilities
   - **User Journeys:** Key workflows and interactions users will have with the system
   - **Functional Requirements:** What the system should do, organized by feature area or user story
   - **Non-Functional Requirements:** Performance, security, usability, reliability, and other quality attributes
   - **Data Requirements:** Data objects, attributes, relationships, and lifecycle considerations
   - **Interface Requirements:** How users and external systems interact with the product
   - **Constraints:** Technical, business, regulatory, or other constraints impacting implementation
   - **Assumptions:** Assumptions about users, environment, or other factors
   - **Acceptance Criteria:** How to verify requirements have been met
   - **Prioritization:** Essential vs. nice-to-have requirements
   - **Edge Cases and Error Scenarios:** Boundary conditions and failure modes

4. **Ask targeted questions** to translate vision into specific, testable requirements. Use a structured approach to ensure all aspects are considered, from core functionality to edge cases.

5. **Follow up on answers.** Clarify ambiguities or gaps. Help convert vague ideas into specific, measurable requirements.

6. **Maintain logical progression** through different requirement types and product areas. Make connections between related requirements to ensure consistency. Check for missing requirements in each category.

7. **Do NOT generate the PRD until:**
   - All significant aspects have been explored
   - The user explicitly confirms you should proceed

8. **Generate the PRD** covering:
   - Product overview and objectives
   - Detailed user personas with goals and scenarios
   - Complete functional requirements (using user stories when appropriate)
   - Non-functional requirements with measurable acceptance criteria
   - Data models and key business rules
   - User interface requirements and considerations
   - Constraints and assumptions
   - Prioritized requirements list

9. **After drafting,** engage in refinement. Adjust specific aspects without regenerating the full document unless explicitly asked.

## Output

- **Final document:** `./ai_docs/core_docs/prd.md`
- **Scratchpad:** `./ai_docs/scratchpad/prd_scratchpad.md`

Create directories if they do not exist.

## Style

Follow **Writing Style Rules** from `references/shared-patterns.md`.

Tone: methodical and analytical while remaining approachable.
