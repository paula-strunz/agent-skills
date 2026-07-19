# Epic template

Use this shape for every epic section inside `EPICS.md` (or any per-epic file under `ai_docs/`). Preserves the product-vision-lead's wording where it exists; only the structure is normalized. All epics get the same sub-heading order so the doc scans cleanly.

Rules:

- Do NOT delete, reword, or rephrase existing epic text. Map the original sentences onto the sub-fields below, leaving them verbatim when possible. If the original is ambiguous, lift a phrase and add an entry under Open questions rather than rewriting.
- Open questions is additive only. Each question is a checkbox so the vision lead can mark them as resolved later without a rewrite.
- When a field has no data, write `-` (single dash). Never invent content.

---

### P{N}. {Title} ({Agent ID if applicable, e.g. A1, A3a})

- **Summary.** {One- to two-sentence purpose, verbatim from the original where possible.}
- **Scope.** {What is in scope. Sub-bullets allowed. Numbered sub-steps if the original was a plan.}
- **Metrics.** {Measurements that define success. Verbatim list from the original; `-` if none given.}
- **Supports KRs.** {OKR KR references, e.g. `O2 KR1`. `-` if none.}
- **Parent OKR.** {`O1. Clinical Development Platform` or `O2. Agentic Workforce`.}
- **Owner.** {Epic owner named by product vision.}
- **Delivery lead.** {Only when distinct from owner; otherwise `-`.}
- **Target / Status.** {E.g. `active`, `planned`, `spec-only by 30 June 2026`, `June 2026 KR1 target`.}
- **Notes.** {Cross-references to other epics, cards in the Features lane, workshop-deck sources. `-` if none.}
- **Open questions.**
  - [ ] {Genuine ambiguity rooted in the original text. Examples: priority ordering, numeric thresholds, data-source selection, output format, integration point with other agents.}
  - [ ] {Another question.}

---

## How to use

1. Starting a new epic: copy the block above into `EPICS.md`, fill each sub-field from the Product Vision Lead's source material (workshop deck, Teams message, planning doc). Leave wording verbatim.
2. Annotating an existing epic: find the epic heading in `EPICS.md`, append the missing sub-fields and the Open questions block. Do not rewrite the Summary or Scope prose.
3. Keeping a related WBS: if the epic has work blocks / phases / tickets, that detail lives in `ai_docs/wbs/<epic-slug>.md` (cross-cutting) or `<repo>/ai_docs/wbs.md` (repo-local). Link from the epic's Notes field.
4. Resolving an open question: replace the checkbox line with `- [x] RESOLVED ({date}): {one-line answer}`. Do not delete; the history lives in the file.
