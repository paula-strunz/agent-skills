# Skill Quality Gate

Pass all checks before considering a skill complete.

## Frontmatter

- [ ] `name` is lowercase-hyphen and <=64 chars
- [ ] `description` includes what + when to use
- [ ] no extra frontmatter fields

## Router quality

- [ ] `SKILL.md` has a clear Purpose, shared Instructions, and Workflow
- [ ] route selection is explicit with `IF` / `THEN` logic when the skill has multiple modes
- [ ] cookbook files exist for route-specific execution details
- [ ] `SKILL.md` stays lean instead of becoming the full manual

## Resource hygiene

- [ ] only necessary files are included
- [ ] no README, CHANGELOG, or INSTALL docs are added
- [ ] prompts, templates, references, scripts, and checklists each have a distinct job
- [ ] large or optional details are moved out of `SKILL.md`

## Operational value

- [ ] another agent could execute this without extra clarification
- [ ] output artifacts are explicitly defined
- [ ] trigger phrases are implied clearly by the description
- [ ] realistic route examples are present where they improve dispatch quality
