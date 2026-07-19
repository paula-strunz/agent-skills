# Work Breakdown Structure (WBS)

## Purpose

Guide an iterative consultation to help the user translate system architecture and requirements into an actionable implementation plan. Covers work breakdown, user stories, sprint planning, testing strategy, and CI/CD design. The output is a comprehensive implementation plan.

Lifecycle position: fifth planning document. Generate after the PRD and architecture when possible, so the work plan reflects both product needs and technical shape.

## Inputs

- `$ARGUMENTS` - Optional context: feature area, epic to break down, or planning scope. If empty, start from the full project scope.

## Process

1. **Load project context.** Follow **Project Context Loading** from `references/shared-patterns.md`.

2. **Follow the Iterative Consultation Pattern** from `references/shared-patterns.md`. Scratchpad path: `./ai_docs/scratchpad/wbs_scratchpad.md`

3. **Explore these dimensions** through conversation:
   - **Work Breakdown Structure:** Break the project into manageable components, features, and tasks
   - **User Story Development:** Transform requirements into specific user stories with acceptance criteria
   - **Task Estimation:** Guide estimating effort and complexity for individual tasks
   - **Dependencies and Sequencing:** Identify dependencies and establish a logical development sequence
   - **Sprint/Iteration Planning:** Organize tasks into time-boxed development cycles
   - **MVP Definition:** Define the minimum viable product and subsequent feature releases
   - **Resource Allocation:** Consider developer capacity and effort allocation
   - **Test Planning:** Develop a testing strategy (unit, integration, user acceptance)
   - **CI/CD Pipeline Design:** Plan the continuous integration and deployment approach
   - **Quality Assurance Measures:** Establish code quality standards and review processes
   - **Risk Mitigation Strategies:** Identify implementation risks and mitigation approaches
   - **Progress Tracking:** Determine how progress will be measured and reported

4. **Ask specific questions** to break the project into concrete, manageable tasks. Use agile development principles to guide story creation and sprint planning.

5. **Follow up on answers.** Ensure tasks are properly scoped. Help refine estimates and identify potential bottlenecks.

6. **Move systematically** through different planning aspects. Make connections between the WBS, user stories, and testing approach. Regularly zoom out to verify alignment with overall project goals and constraints.

7. **Do NOT generate the implementation plan until:**
   - All significant aspects have been explored
   - The user explicitly confirms you should proceed

8. **Generate the implementation plan** covering:
   - Complete work breakdown structure with hierarchical task organization
   - User stories with acceptance criteria and priorities
   - Sprint/iteration plan with task allocations
   - Testing and quality assurance strategy
   - CI/CD pipeline approach
   - Risk assessment and mitigation strategies
   - Progress tracking and reporting plan

9. **After drafting,** engage in refinement. Adjust specific aspects without regenerating the full document unless explicitly asked.

## Output

- **Final document:** `./ai_docs/core_docs/wbs.md`
- **Scratchpad:** `./ai_docs/scratchpad/wbs_scratchpad.md`

Create directories if they do not exist.

## Style

Follow **Writing Style Rules** from `references/shared-patterns.md`.

Tone: practical and action-oriented while remaining supportive.
