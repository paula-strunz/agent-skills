# Update Work Breakdown Structure

## Purpose

Update an existing WBS by analyzing recent git activity, matching commits to planned tasks, detecting unplanned work, and adjusting complexity ratings. Every change is evidence-based, linked to specific commits, files, or code artifacts. Uses interactive clarification when ambiguity exists.

## Inputs

- `$ARGUMENTS`: What to analyze (e.g., "last 20 commits", "since Monday", specific areas). Default: last 2 days of commits if no commit count specified.
- Existing WBS at `./ai_docs/core_docs/wbs.md`

## Process

1. **Load project context.**
   Follow **Project Context Loading** from `references/shared-patterns.md` to understand architecture, source directory layout, and conventions.

2. **Read Current WBS.**
   READ `./ai_docs/core_docs/wbs.md`. Note existing tasks, complexity ratings, and completion status.

3. **Analyze Recent Commits.**

   ```bash
   # If user specifies: "last 20 commits"
   git log --oneline -20

   # Default: last 2 days
   git log --since="2 days ago" --oneline

   # Show which files changed most (complexity indicators)
   git log --since="2 days ago" --name-only --pretty=format: | \
     sort | uniq -c | sort -nr | head -10
   ```

4. **Detect Unplanned Work.**

   ```bash
   # Find recent TODOs
   git grep -n "TODO\|FIXME\|HACK" | head -20

   # New files not tracked in WBS
   git ls-files --others --exclude-standard | head -20

   # Recently modified files in the project source directory
   git diff --stat HEAD~10
   ```

   Scan the project's source directory, identified from project context or standard locations like `src/`, `app/`, and `lib/`, for new files and changes.

5. **Match Work to Tasks.**
   - Map commit messages to WBS task descriptions
   - Identify work without corresponding WBS items
   - Detect completed tasks, in-progress work, and new discoveries

6. **Interactive Clarification.**
   When ambiguity exists, ask specific questions:
   - "I found 5 commits related to 'caching' but no WBS task. Was this planned work?"
   - "Task X shows no commits for 3 days. Is it blocked or deprioritized?"
   - "These 3 new files suggest feature Y. Should I add this as a new task?"

## Key Signals to Detect

### Task Completion
- Commits with "feat:", "implement", "complete" + task keywords
- Test files created for the feature
- No TODOs remaining in related files

### Increased Complexity
- Same file modified in 5+ commits (more complex than expected)
- New dependencies added (check the project's dependency files: requirements.txt, pyproject.toml, package.json, etc.)
- Error handling commits (edge cases discovered)

### Unplanned Tasks
- New modules without WBS entry
- "fix:" commits for non-existent tasks
- Refactoring commits indicating tech debt

## Update Format

```markdown
## WBS Updates - Based on last 20 commits

### Completed Tasks
- [x] Implement data processing pipeline
  - Evidence: Commits a1b2c3, d4e5f6 - created pipeline + 3 stages
  - Complexity: Medium (expected) -> High (actual) - custom parsing logic added

### In Progress
- [~] Add search integration (70% complete)
  - Evidence: search_client.py created, needs query optimization
  - Discovered: Need separate indexing step (not in original WBS)

### New Tasks Discovered
- [ ] Create input validation layer
  - Evidence: TODO in processor.py:45
  - Complexity: Low

- [ ] Add error recovery for API timeouts
  - Evidence: 3 timeout-related commits in last 2 days
  - Complexity: Medium

### Complexity Adjustments
- Database integration: Low -> Medium
  - Evidence: 8 commits for connection pooling issues
  - Added subtasks: connection retry logic, pool management
```

Always use the actual format in the WBS document, maintaining consistency with existing entries.

## Change Log Format

Add a dedicated section in the WBS:

```markdown
## Change History

### YYYY-MM-DD Update
**Evidence Source**: Last 20 commits
**Key Changes**:
- Marked "Implement data pipeline" as complete (commits: a1b2c3, d4e5f6)
- Increased complexity of "Database Integration" from Low to Medium (8 fix commits)
- Added new task: "Implement retry logic" (discovered via TODOs in connection.py:45-52)

**Decisions Made**:
- User decided to split "API Integration" into 3 subtasks for better tracking
- Deferred "Performance Optimization" to next sprint due to current priorities
```

## Development Insights Section

Also maintain a section for patterns and learnings:

```markdown
## Development Insights

### Patterns Observed
- Database tasks consistently take 2x initial complexity estimate
- New API integrations always require error handling subtasks
- Test coverage gaps discovered when implementing error paths

### Technical Decisions
- Chose async pattern for all external API calls (better error handling)
- Standardized on a schema validation library for all data validation (type safety)
```

## Output

**ALWAYS update the existing WBS**: `./ai_docs/core_docs/wbs.md`

- NEVER create new versions or duplicate files
- Maintain change log and decision history within the document

## Critical Rules

1. **ASK before assuming.** If task descriptions are unclear or you need more context, ask the user.
2. **NEVER invent tasks.** Only document work that has evidence in commits or code.
3. **NO assumptions about future work.** Only update based on what actually happened.
4. **Update in place.** Always modify the existing WBS file, never create versions.
5. **Capture decisions.** Record WHY changes were made, not just what changed.
6. **Track patterns.** Note recurring issues or consistent estimation errors.
7. Follow the Writing Style Rules from shared-patterns.md.

Task complexity matters more than time estimates when working with AI assistance.
