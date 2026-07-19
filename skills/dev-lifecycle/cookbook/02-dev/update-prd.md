# Update Product Requirements Document

## Purpose

Update an existing PRD based on WBS evolution, implementation learnings, and stakeholder feedback. Uses the Iterative Consultation Pattern to understand requirement changes before modifying the document. Every update is evidence-based and linked to WBS changes or user confirmation.

## Inputs

- `$ARGUMENTS`: What triggered the update (e.g., "sprint 3 completed", "auth requirements changed", specific areas to review)
- Existing PRD at `./ai_docs/core_docs/prd.md`
- Existing WBS at `./ai_docs/core_docs/wbs.md`

## Process

1. **Load project context.**
   Follow **Project Context Loading** from `references/shared-patterns.md` to understand architecture and conventions.

2. **Read the current PRD** from `./ai_docs/core_docs/prd.md`.

3. **Analyze WBS Evolution.**
   READ the WBS from `./ai_docs/core_docs/wbs.md`, focusing on:
   - Completed tasks and their outcomes
   - New tasks that suggest requirement changes
   - Complexity adjustments and their reasons
   - Removed tasks indicating obsolete requirements

4. **Map WBS Changes to PRD Requirements**
   - Which completed tasks fulfill which requirements?
   - What new tasks indicate missing requirements?
   - Which complexity increases suggest underspecified requirements?
   - What removed tasks indicate obsolete requirements?

5. **Interactive Requirement Consultation**

   Based on WBS analysis, ask specific questions aligned with PRD sections:

   **For Functional Requirements:**
   - "Task X is complete. Does the implementation fully satisfy functional requirement Y?"
   - "The implementation required 3 additional subtasks. What functional requirements were underspecified?"

   **For Non-Functional Requirements:**
   - "I see retry logic was added. What reliability/performance requirement does this address?"
   - "Database tasks increased in complexity. What scalability requirements emerged?"

   **For User Journey Changes:**
   - "This new workflow was not in the original user journeys. Which persona needs this?"
   - "Has the user's interaction model changed based on implementation feedback?"

   **For Data Requirements:**
   - "New data models were added. What business rules or relationships were discovered?"
   - "Data migration tasks appeared. Were data lifecycle requirements missed?"

   **For Edge Cases:**
   - "Multiple error handling tasks added. What edge cases were discovered?"
   - "Should these become formal error scenarios in the PRD?"

6. **Maintain a scratchpad** per the Scratchpad Pattern in shared-patterns.md. Path: `./ai_docs/scratchpad/prd_update_scratchpad.md`

7. **Document Requirement Evolution** using the update format below.

## Question Framework

### Discovery Questions

- "What user feedback has influenced these changes?"
- "Have any business objectives shifted based on development insights?"
- "What technical constraints were discovered during implementation?"

### Validation Questions

- "This pattern appears multiple times. Should it become a formal requirement?"
- "Does this change affect your success criteria?"
- "Are there downstream requirements impacted by this change?"

### Context Questions

- "What drove this decision?"
- "Is this a temporary workaround or permanent requirement change?"
- "Who are the stakeholders affected by this change?"

## Update Format

```markdown
### 3.2 Authentication Requirements

**Original**: Users shall authenticate via email/password
<!-- Updated YYYY-MM-DD: Based on enterprise customer feedback -->
**Current**: Users shall authenticate via email/password OR SSO integration
- **Rationale**: Enterprise customers require SAML/OAuth integration
- **WBS Evidence**: Added 3 SSO-related tasks, increased auth complexity to High
- **Impact**: Affects user management, session handling, and security requirements
```

## Change Documentation

Every PRD update must include:

1. **Date stamp** of the change
2. **WBS evidence** that triggered the update
3. **Business rationale** (not technical reasons)
4. **Stakeholder impact** assessment

## Requirement Health Checks

After updates, verify each PRD section:

- **Functional Requirements**: Still specific and testable? User stories still valid? Dependencies updated?
- **Non-Functional Requirements**: Performance metrics still achievable? Security requirements adequate?
- **User Personas and Journeys**: Do personas reflect actual users? Are journeys aligned with implementation?
- **Acceptance Criteria**: Still measurable and verifiable? Do they cover discovered edge cases?
- **Data Requirements**: Models complete with discovered relationships? Business rules captured?

## Output

**ALWAYS update in place**: `./ai_docs/core_docs/prd.md`

- Use inline comments for change tracking
- Preserve historical context where valuable
- Never create PRD versions or duplicate files

## Critical Rules

1. **NEVER assume requirements.** Always ask for clarification.
2. **Link to WBS evidence.** Every change needs WBS backing.
3. **Focus on the WHY.** Business reasons, not technical details.
4. **Maintain requirement integrity.** Do not break existing dependencies.
5. **Ask before removing.** Never delete requirements without confirmation.
6. Follow the Writing Style Rules from shared-patterns.md.

The PRD captures WHAT and WHY, while the WBS captures HOW. Keep the PRD focused on business requirements, not implementation details.
