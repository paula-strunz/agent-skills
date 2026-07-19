# Architecture Design Document (ADD)

## Purpose

Guide an iterative consultation to help the user design and document their system architecture. Works for greenfield and existing systems, from single-service apps to multi-service platforms. The output is a comprehensive system architecture document.

Lifecycle position: third planning document. Use the PRD as input when available.

## Inputs

- `$ARGUMENTS` - Optional context: system name, component to design, or architectural concern to explore. If empty, start from scratch.

## Process

1. **Load project context.** Follow **Project Context Loading** from `references/shared-patterns.md`.

2. **Follow the Iterative Consultation Pattern** from `references/shared-patterns.md`. Scratchpad path: `./ai_docs/scratchpad/add_scratchpad.md`

3. **Explore these dimensions** through conversation:
   - **Overall Vision and Use Cases:** Main goal, high-level system usage, expected contributions of each service
   - **User Roles and Personas:** Who interacts with the system, their expectations and requirements
   - **Service Interaction and Integration:** Main services/modules, how they interact, communication mechanisms (API types, message queues, etc.)
   - **Endpoint Definition and Data Flow:** Endpoints each service exposes, data flow between services, data storage strategies
   - **Technical Alternatives and Trade-offs:** Different architectural approaches (centralized vs. distributed, sync vs. async), pros and cons
   - **Data Management and Storage:** Databases, caching strategies, data retention policies
   - **External Integrations:** Third-party systems or external APIs
   - **Security and Compliance:** Data encryption, access control, regulatory compliance (GDPR, HIPAA, etc.)
   - **Performance and Scalability:** Response times, throughput, scalability requirements
   - **Testing and Quality Assurance:** Testing strategies (unit, integration, performance)
   - **Deployment and Infrastructure:** Cloud vs. on-premises, containerization, orchestration
   - **Monitoring and Observability:** Logging, alerting, performance metrics
   - **User Experience and Interface Design:** Design principles, accessibility, UX considerations
   - **Documentation and Knowledge Sharing:** API docs, user manuals, developer guides
   - **Maintenance and Support:** Bug fixes, updates, user support
   - **Future-Proofing and Expansion:** Potential future modules, flexibility for change

4. **Ask insightful, open-ended questions** covering both high-level strategy and granular details (system interactions, data management, security).

5. **Keep a mental graph** of requirements and their interconnections. Navigate between related topics as the conversation drills into specifics and back up to broader context. Cover all major aspects, including those the user might not consider immediately relevant.

6. **Explore technical alternatives.** Present trade-offs and gather the user's insights on preferences and constraints.

7. **Do NOT generate the architecture document until:**
   - All significant aspects have been explored
   - The user explicitly confirms you should proceed

8. **Generate the architecture document** covering:
   - Project overview and objectives
   - Detailed descriptions of each service and their interactions
   - Use cases, user personas, and endpoints exposed by each service
   - Data flow diagrams and storage strategies
   - Technical recommendations with trade-offs and integration points
   - Security, scalability, and future expansion considerations

9. **After drafting,** engage in refinement. Adjust specific aspects without regenerating the full document unless explicitly asked. Do not regenerate the entire document unless the user requests it (it wastes tokens).

## Output

- **Final document:** `./ai_docs/core_docs/add.md`
- **Scratchpad:** `./ai_docs/scratchpad/add_scratchpad.md`

Create directories if they do not exist.

## Style

Follow **Writing Style Rules** from `references/shared-patterns.md`.

Tone: authoritative and approachable, offering expert insights while encouraging detailed and reflective dialogue.
