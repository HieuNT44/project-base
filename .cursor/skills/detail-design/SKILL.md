---
name: detail-design
description: Creates Detail Design artifacts in .notebook/06_design/ — screen layout, fields and validation, logic, sequence diagrams, API contracts, batch specs, class design. Use after Basic Design (or for XS/S minimal specs) and before Develop. Use when implementation-ready specs are needed.
---

# Detail Design

Produce **Detail Design (DD)** artifacts under [.notebook/06_design/](../../.notebook/06_design/) — implementation-ready specs linked from backlog tasks.

## When to Use

- BD complete (or XS/S scope with project baseline)
- Before writing code for UI, data model, integration, or batch jobs
- Task **Design** section needs concrete artifact links

**When NOT to use:** Pure config copy-paste with AC already sufficient — note "trivial" in task **Design** and skip.

## Pipeline position

```
basic-design? → detail-design → Develop
```

## Step 1 — Read context

1. BD artifacts for this function (`01_functions/{slug}/`, `00_project/`)
2. `backlogs/task-{id}/README.md` — AC, test plan, files/artifacts
3. [06_design/README.md](../../.notebook/06_design/README.md) templates

## Step 2 — Pick artifacts

| Work type | Artifacts | Location |
|-----------|-----------|----------|
| UI screen | Layout, Events, Messages | `02_screens/{id}/` |
| Data model | Table Definition, Data Dictionary | `03_objects/{name}/` |
| Business logic | Logic Design, Sequence | `06_logic/{slug}/` |
| Integration | Interface Spec, API Document | `04_integrations/{name}/` |
| Batch job | Batch Design | `05_batches/{name}/` |
| OOP module | Class Design (section in logic) | `06_logic/{slug}/` |

## Step 3 — Write DD docs

- Copy from `_*.template.md`
- Fields must be implementable (name, type, validation)
- API docs: request, response, error codes
- Align with [NFR](../../.notebook/03_non-functional-requirements/) (security, performance)

## Step 4 — Update backlog task

Fill **Design** table in `backlogs/task-{id}/README.md` with all DD paths.

## Step 5 — Human gate

Human confirms DD matches AC before status moves to `in-progress` for M+ tasks.

## Red flags

- Vague fields ("add field for name") without type/required/rules
- API without error codes
- Design contradicts backlog AC

## Verification

- [ ] DD files exist and linked from task
- [ ] Each AC traceable to a design section
- [ ] Test plan can be derived from DD

## See also

- [basic-design](./basic-design/SKILL.md)
- [planning-and-task-breakdown](./planning-and-task-breakdown/SKILL.md)
