# Purpose

Compare the original project charter's vision and objectives against what was actually built, detect gaps and pivots, consult with the user on business outcomes, and update the charter to reflect delivered reality. The updated charter serves as a record of what was planned, what changed, and why.

## Inputs

- `$ARGUMENTS`: Specific areas to focus on (e.g., "stakeholder changes", "new market focus"), or empty to do a full comparison.

## Process

### 1. Load project context

Follow **Project Context Loading** from `shared-patterns.md` to understand the project scope.

### 2. Read existing documents

Read the original project charter from `./ai_docs/core_docs/project_charter.md`. Also read the PRD (`./ai_docs/core_docs/prd.md`), WBS (`./ai_docs/core_docs/wbs.md`), and ADD (`./ai_docs/core_docs/add.md`) if they exist. These provide evidence of what was actually built vs planned.

If the charter does not exist, inform the user and offer to generate one from scratch using the pre-dev charter cookbook instead.

### 3. Compare vision to reality

- Read the charter's original vision and objectives
- Analyze the PRD for actual features implemented
- Check the WBS for scope changes and completed work
- Identify divergence between planned and built

### 4. Stakeholder analysis

- Compare charter stakeholders to PRD personas
- Identify new user groups discovered during development
- Note changed priorities based on implementation evidence

### 5. Objective achievement detection

For each original objective:
- Map it to PRD requirements
- Check WBS completion status
- Identify partial or missed objectives
- Find unexpected achievements (features built that weren't in the original plan)

### 6. Interactive consultation

Follow the Iterative Consultation Pattern from `shared-patterns.md`. Use the Scratchpad Pattern at `./ai_docs/scratchpad/charter_update_scratchpad.md`.

Ask evidence-based questions depending on what the document comparison reveals:

**When vision changed**: "Original vision was X, but PRD shows heavy focus on Y. What drove this pivot?" / "Features A, B, C in PRD weren't in original objectives. What new opportunity emerged?"

**When stakeholders evolved**: "Charter focused on [stakeholder], but PRD shows [new persona]. When did this shift occur?" / "The PRD user journeys suggest [stakeholder group] became primary. What validated this?"

**When scope changed**: "WBS shows [major feature] was added mid-project. What business need drove this?" / "Original objective X has no corresponding WBS tasks. Was this descoped? Why?"

**When technology impacted business**: "ADD shows shift to [technology]. Did this enable new business capabilities?" / "Architecture supports [scale/feature]. Does this change market positioning?"

### 7. Update the charter

Follow the Writing Style Rules from `shared-patterns.md`. Use this structure:

```markdown
# Project Charter - [Project Name]
*Document Version: Final | Updated: [Date]*

## Executive Summary
**Original Vision**: [Preserved from original]
**Delivered Solution**: [What was actually built, based on PRD/ADD analysis]
**Key Evolution**: [Major pivots with business rationale]

## Business Objectives Assessment

### Objective 1: [Original from charter]
**Status**: [Based on PRD/WBS analysis]
**Evidence**: [Specific features/capabilities delivered]
**Business Impact**: [From user consultation]

### Emerged Objectives [Detected from PRD/WBS]
1. **[Objective inferred from built features]**
   - Evidence: [Features/requirements that suggest this]
   - Business Driver: [From consultation]

## Stakeholder Outcomes
| Original Stakeholder | Status | Evidence | Impact |
|---------------------|---------|----------|--------|
| [From charter] | [Served/Modified/Replaced] | [PRD personas] | [Value delivered] |

## Market Position
**Original Target**: [From charter]
**Actual Focus**: [Based on PRD analysis]
**Rationale**: [From consultation]

## Success Metrics
Map original KPIs to actual capabilities:
- Metric 1: [Original] → [What's measurable with built solution]
- Metric 2: [Original] → [Adjusted based on reality]

## Risk Outcomes
Review original risks against built solution:
- Risk 1: [Mitigated/Materialized/Evolved]
- Evidence: [Architecture or features that address/reveal this]

## Strategic Impact
Based on delivered capabilities:
1. [Business opportunity from actual features]
2. [Market position from technology choices]
3. [Future potential from architecture]
```

### 8. Validate with user

Confirm the updated charter. Adjust specific sections without regenerating the full document.

## Key Instructions

1. **Analyze first, ask second**: Base questions on document evidence
2. **Map objectives to features**: Connect charter goals to PRD/WBS deliverables
3. **Infer from architecture**: ADD choices have business implications
4. **No assumptions**: Confirm all inferences with the user
5. **Focus on gaps**: What changed and why matters most

## Output

Update the charter in place at `./ai_docs/core_docs/project_charter.md`. The updated charter reflects what was actually delivered and its business impact, preserving the original vision for comparison.
