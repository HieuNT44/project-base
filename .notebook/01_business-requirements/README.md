# Business requirements

Stable **business** context: why the project exists, for whom, and within what scope.  
Does not list features (see [function-list](../02_function-list/)), NFRs (see [non-functional-requirements](../03_non-functional-requirements/)), or tasks (see [backlog](../backlogs/)).

## Files

| File | Purpose |
|------|---------|
| [overview.template.md](./overview.template.md) | Copy to `overview.md` when starting a project |
| `glossary.md` | *(optional)* Domain terms — split from overview when long |
| `lifecycle.md` | *(optional)* Business process — split when long |
| `access-matrix.md` | *(optional)* Who uses which screen/channel |
| `phased-delivery.md` | *(optional)* Business rollout phases |

Small projects: one `overview.md` is enough.  
Large projects: keep sections 1–6 in `overview.md`; move sections 7–11 to separate files.

## Sections in overview.template.md

| # | Section | Required |
|---|---------|----------|
| 1 | Overview | Yes |
| 2 | Stakeholders | Yes |
| 3 | Business goals & success metrics | Yes |
| 4 | Scope IN / OUT | Yes |
| 5 | Assumptions | Yes |
| 6 | Constraints | Yes |
| 7 | Glossary | Optional |
| 8 | Business process / lifecycle | Optional |
| 9 | Who uses what | Optional |
| 10 | Phased delivery (business view) | Optional |
| 11 | Business-level acceptance | Optional |
| 12 | Approval | Yes |

## When to update

- Project kickoff
- Scope IN/OUT changes approved by stakeholder
- New stakeholder group affects delivery
- Business process or glossary changes

## Analyze checklist

When processing a new request ([workflow](../workflow.md)):

- [ ] Request fits **scope IN**
- [ ] Request is not listed in **scope OUT**
- [ ] Success metrics still align with **business goals**
- [ ] Actors match **stakeholders** and **who uses what** (if documented)
- [ ] Request does not contradict **assumptions** without explicit approval
