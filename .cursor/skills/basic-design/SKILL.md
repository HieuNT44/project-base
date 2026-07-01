---
name: basic-design
description: Creates Basic Design artifacts in .notebook/06_design/ — system overview, architecture, business flows, screen lists, ERD, permission and integration overviews. Use after backlog task is ready and before Detail Design or implementation for M+ scope. Use when starting a new function, phase, or feature area needing structural design.
---

# Basic Design

Produce **Basic Design (BD)** artifacts under [.notebook/06_design/](../../.notebook/06_design/) before Detail Design or code for non-trivial work.

## When to Use

- Backlog task status = `ready` and scope M+
- New function area or project phase
- Architecture or permission decisions needed
- Screen inventory or business flow not yet documented

**When NOT to use:** XS/S tasks with obvious scope — link project baseline only; use [detail-design](./detail-design/SKILL.md) for minimal screen/field specs inline.

## Pipeline position

```
Plan (ready) → basic-design → detail-design → Develop
```

## Step 1 — Read context

1. [.notebook/workflow.md](../../.notebook/workflow.md) and [06_design/README.md](../../.notebook/06_design/README.md)
2. Relevant `backlogs/task-{id}/README.md` — AC, type, scope
3. Catalogs `01_`–`03_` and existing `06_design/` artifacts

## Step 2 — Pick artifacts

| Need | Artifact | Location |
|------|----------|----------|
| First time / new phase | System Overview | `00_project/system-overview.md` |
| UI stack decisions | Architecture Frontend | `00_project/architecture-frontend.md` |
| API / service decisions | Architecture Backend | `00_project/architecture-backend.md` |
| Roles & access | Permission Design | `00_project/permission-design.md` |
| External systems | Integration Overview | `00_project/integration-overview.md` |
| Scheduled jobs (overview) | Batch Overview | `00_project/batch-overview.md` |
| Error strategy | Error Handling Overview | `00_project/error-handling-overview.md` |
| New function | Business Flow, Screen List, ERD | `01_functions/{slug}/` |

Copy from `_*.template.md` in each folder.

## Step 3 — Write BD docs

- Use templates; drop `_` prefix from filename
- Link back to function-list row and backlog task
- Do not duplicate AC from backlog — reference them

## Step 4 — Update backlog task

In `backlogs/task-{id}/README.md` **Design** section, list BD artifact paths.

## Step 5 — Handoff

| Next | When |
|------|------|
| [detail-design](./detail-design/SKILL.md) | Screen layout, fields, logic, API detail needed |
| Develop | XS/S with minimal DD in task only (human approval) |

## Red flags

- Implementing M+ work with no BD artifacts
- Duplicating full task spec inside design docs
- Skipping permission design when roles/data access change

## Verification

- [ ] BD artifacts created in correct `06_design/` paths
- [ ] Task **Design** section links to new files
- [ ] No implementation code written in this skill

## See also

- [detail-design](./detail-design/SKILL.md)
- [spec-driven-development](./spec-driven-development/SKILL.md)
