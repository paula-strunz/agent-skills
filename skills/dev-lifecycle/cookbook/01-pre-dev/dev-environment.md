# Development Environment Guide

## Purpose

Guide an iterative consultation to help the user establish an efficient, scalable development environment before coding begins. Covers local setup, repo structure, CI/CD, code quality tools, and developer productivity. The output is a comprehensive development environment setup plan.

Lifecycle position: fourth planning document by default. Generate earlier when setup is blocking, or after architecture when stack decisions are still forming.

## Inputs

- `$ARGUMENTS` - Optional context: specific setup concern, tooling question, or area to explore. If empty, start from the full environment scope.

## Process

1. **Load project context.** Follow **Project Context Loading** from `references/shared-patterns.md`.

2. **Follow the Iterative Consultation Pattern** from `references/shared-patterns.md`. Scratchpad path: `./ai_docs/scratchpad/dev_environment_scratchpad.md`

3. **Explore these dimensions** through conversation:
   - **Development Environment Configuration:** Optimal local setup, required tools, IDEs, and extensions
   - **Repository Structure:** Logical, scalable project structure and file organization
   - **Version Control Strategy:** Branching strategy, commit conventions, code review processes
   - **CI/CD Pipeline Setup:** Automated build, test, and deployment workflows
   - **Project Documentation Framework:** Templates and structure for technical documentation
   - **Code Quality Tools:** Linters, formatters, static analysis configuration
   - **Environment Parity:** Consistency across development, testing, and production environments
   - **Dependency Management:** Approach for managing external dependencies and packages
   - **Configuration Management:** Handling different environment configurations
   - **Backup and Recovery:** Backup processes for code and development artifacts
   - **Local Testing Framework:** Framework for unit, integration, and other testing types
   - **Developer Productivity Tools:** Tools to enhance development efficiency

4. **Ask specific questions** about the user's preferences, existing tooling, and project requirements. Consider the technology stack and architectural decisions when recommending approaches.

5. **Follow up on answers.** Tailor recommendations to the user's specific context. Help resolve conflicts or trade-offs in environment design.

6. **Move systematically** through different setup aspects. Make connections between related components (e.g., how testing integrates with CI/CD). Ensure all critical setup aspects are addressed before moving to implementation.

7. **Do NOT generate the setup plan until:**
   - All significant aspects have been explored
   - The user explicitly confirms you should proceed

8. **Generate the setup plan** covering:
   - Development environment configuration details
   - Repository structure and organization guidelines
   - CI/CD pipeline configuration
   - Documentation templates and structure
   - Code quality tool configuration
   - Development workflow guidelines
   - Setup scripts or automation (if applicable)

9. **After drafting,** engage in refinement. Adjust specific aspects without regenerating the full document unless explicitly asked.

## Output

- **Final document:** `./ai_docs/core_docs/dev_environment_guide.md`
- **Scratchpad:** `./ai_docs/scratchpad/dev_environment_scratchpad.md`

Create directories if they do not exist.

## Style

Follow **Writing Style Rules** from `references/shared-patterns.md`.

Tone: practical and technically precise while remaining approachable.
