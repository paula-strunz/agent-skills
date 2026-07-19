# Project Charter

## Purpose

Guide an iterative consultation to help the user define a project's business foundation: vision, stakeholders, risks, constraints, and success criteria. The output is a comprehensive project charter document.

Lifecycle position: first planning document. Start here when the project direction, business rationale, or success criteria are still unclear.

## Inputs

- `$ARGUMENTS` - Optional context: project name, rough idea, or topic to explore. If empty, start from scratch with open-ended questions.

## Process

1. **Load project context.** Follow **Project Context Loading** from `references/shared-patterns.md`.

2. **Follow the Iterative Consultation Pattern** from `references/shared-patterns.md`. Scratchpad path: `./ai_docs/scratchpad/project_charter_scratchpad.md`

3. **Explore these dimensions** through conversation:
   - **Project Vision and Purpose:** Main goal, problem being solved, value to users or customers
   - **Business Objectives and Success Criteria:** Measurable goals and KPIs
   - **Stakeholder Identification:** All individuals or groups who influence or are affected by the project
   - **Market Analysis:** Target market, customer needs, potential market size
   - **Competitive Landscape:** Existing solutions, differentiation
   - **Resource Constraints:** Time, budget, technical constraints
   - **Initial Risk Assessment:** Risks, likelihood, impact, mitigations
   - **Regulatory and Compliance:** Legal, privacy, or industry-specific requirements
   - **Timeline and Milestones:** High-level timeline and major milestones
   - **Revenue Model and Business Strategy:** How the project generates value
   - **Ethical Considerations:** Potential ethical implications
   - **Future Growth and Scalability:** Long-term vision and evolution

4. **Ask insightful, open-ended questions** to help the user clarify their vision. Mix strategic and tactical questions. Follow up on answers to dive deeper into areas needing clarification.

5. **Maintain a mental graph** of how different aspects connect. Navigate between high-level and granular topics. Ensure all critical business aspects are covered, especially those the user might overlook.

6. **Do NOT generate the charter until:**
   - All significant aspects have been explored
   - The user explicitly confirms you should proceed

7. **Generate the project charter** covering:
   - Project vision statement and executive summary
   - Business objectives and success metrics
   - Stakeholder analysis
   - Market and competitive positioning
   - Initial risk assessment
   - Resource constraints and timeline
   - Next steps and immediate action items

8. **After drafting,** engage in refinement. Adjust specific aspects without regenerating the full document unless explicitly asked.

## Output

- **Final document:** `./ai_docs/core_docs/project_charter.md`
- **Scratchpad:** `./ai_docs/scratchpad/project_charter_scratchpad.md`

Create directories if they do not exist.

## Style

Follow **Writing Style Rules** from `references/shared-patterns.md`.

Tone: professional and conversational, offering business expertise while encouraging thoughtful reflection.
