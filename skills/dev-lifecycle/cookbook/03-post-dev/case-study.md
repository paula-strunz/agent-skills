# Purpose

Analyze a completed project implementation and generate a compelling case study that documents the challenge, solution, results, and lessons learned. The case study targets technical leaders and decision makers who want concrete evidence of success and reusable insights.

## Inputs

- `$ARGUMENTS`: Project name, feature area, or specific focus for the case study. If empty, generate a case study covering the entire project.

## Process

1. **Load project context** per the Project Context Loading pattern in `shared-patterns.md` to understand the project's purpose, architecture, and tech stack.

2. **Gather project information**
   - Review existing project documentation (charter, PRD, architecture docs) if available under `./ai_docs/core_docs/`
   - Analyze the codebase and git history to understand the implementation journey
   - Collect any metrics, performance data, or configuration that reveals scale and results
   - Document the timeline and milestones from git history

3. **Identify key story elements**
   - **Challenge**: What problem was being solved? What constraints existed?
   - **Solution**: How was it approached and implemented?
   - **Results**: What outcomes were achieved?
   - **Lessons**: What was learned in the process?

4. **Consult with the user** using the Iterative Consultation Pattern from `shared-patterns.md`
   - Ask about business context, stakeholder feedback, and measurable outcomes
   - Clarify metrics the user can provide (performance, cost savings, adoption)
   - Confirm which aspects to highlight

5. **Structure the narrative** following the Case Study Template below

6. **Write the case study** following the Writing Style Rules in `shared-patterns.md`

### Case Study Template

#### 1. Executive Summary
- One-paragraph overview covering problem, solution, and outcome
- Quantifiable results highlight

#### 2. The Challenge
- Business context and constraints
- Technical requirements
- Success criteria defined upfront
- Why existing solutions were insufficient

#### 3. The Solution Approach
- Architecture decisions and rationale
- Technology stack selection
- Development methodology
- Key innovations or unique approaches

#### 4. Implementation Journey
- Project phases and milestones
- Challenges encountered and overcome
- Pivots or major decisions made
- Team dynamics and collaboration

#### 5. Technical Deep Dive
- System architecture diagram
- Key components and their interactions
- Performance optimizations
- Security and scalability considerations

#### 6. Results and Impact
- Quantitative metrics: performance improvements, cost savings, efficiency gains, user adoption rates
- Qualitative outcomes: user satisfaction, team learnings, process improvements

#### 7. Lessons Learned
- What worked well
- What could be improved
- Unexpected discoveries
- Reusable patterns identified

#### 8. Future Roadmap
- Planned enhancements
- Scaling considerations
- Potential applications in other domains

### Domain-Specific Highlights

**For AI/LLM Projects:** Model selection process, prompt engineering breakthroughs, cost-performance trade-offs, accuracy metrics.

**For Workflow Systems:** Process automation achievements, error handling, integration complexities solved, scalability.

**For Full-Stack Applications:** UX improvements, system performance metrics, security measures, DevOps success.

### Metrics to Include

Quantify success wherever possible:
- **Performance**: Response times, throughput
- **Reliability**: Uptime, error rates
- **Efficiency**: Time saved, automation percentage
- **Scale**: Users supported, data processed
- **Cost**: Development time, operational savings

### Visual Elements

Suggest including: architecture diagrams, before/after comparisons, performance charts, user journey flows, timeline graphics.

## Output

A well-structured markdown document saved to `./ai_docs/case_studies/<project_name>_case_study.md` (derive the project name from project context or the user's input).

The document should be 2-4 pages with clear section headings, bullet points for key information, highlighted metrics, suggested locations for visuals, and pull quotes for impact statements.
