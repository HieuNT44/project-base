# Workflow

Spec-driven planning → design → develop → test → report.

```
INTAKE (external)
    → ANALYZE (01–03)
    → UPDATE CATALOGS (02–03, 01 if scope changes)
    → backlogs/ (draft → ready)
    → Human approve
    → 06_design/ (Basic + Detail)
    → Develop (backend/ | frontend/ | infra/)
    → Test (test/ + backlog verification)
    → 05_reports/ (delivery)
```

Raw intake is not persisted in this repo — write outcomes to numbered folders and `backlogs/` only.

---

## Step 1 — Receive request (intake)

**Input examples:** chat text, meeting notes, Redmine/Jira ticket, email.

**Action:** Extract problem, user, desired outcome, constraints. Do not create an intake file in this repo.

Use skill [analyze-intake-to-task](../.cursor/skills/analyze-intake-to-task/SKILL.md) to produce the first artifact: `backlogs/task-{id}/README.md` (status `draft`). Optional upstream: [interview-me](../.cursor/skills/interview-me/SKILL.md), [idea-refine](../.cursor/skills/idea-refine/SKILL.md).

---

## Step 2 — Analyze

Cross-check the request against:

| Source | Question |
|--------|----------|
| [01_business-requirements/](./01_business-requirements/) | Still within project scope? |
| [02_function-list/](./02_function-list/) | Maps to existing Function/Task or new capability? |
| [03_non-functional-requirements/](./03_non-functional-requirements/) | Which NFRs apply or change? |

Also check [00_references/](./00_references/) (INVEST, DoD) when sizing work.

If no task exists yet, run [analyze-intake-to-task](../.cursor/skills/analyze-intake-to-task/SKILL.md) (creates one draft task with **Intake analysis** section).

---

## Step 3 — Update catalogs (if needed)

| Situation | Update |
|-----------|--------|
| New product capability | [02_function-list/](./02_function-list/) |
| New or changed NFR | [03_non-functional-requirements/](./03_non-functional-requirements/) |
| Scope or stakeholder change | [01_business-requirements/](./01_business-requirements/) |

Most one-off requests only need a **backlog** task, not catalog changes.

---

## Step 4 — Create or update backlog

| Item | Location |
|------|----------|
| Task | `backlogs/task-{id}/README.md` |
| Subtask | `backlogs/task-{id}/subtask-{id}_{slug}.md` |

If the work maps to a [02_function-list](./02_function-list/) catalog row, set the **Backlog** column to `../../backlogs/task-{id}/` for that row.

Each task file must include: **type**, description, **value**, [INVEST](./00_references/invest.md) checklist, acceptance criteria, **estimation**, **test plan**, dependencies.

Use [spec-driven-development](../.cursor/skills/spec-driven-development/SKILL.md) for catalog updates and [planning-and-task-breakdown](../.cursor/skills/planning-and-task-breakdown/SKILL.md) to harden or split tasks to `ready`.

---

## Step 5 — Human approve (Plan gate)

Before Design / Develop:

- [ ] Request understood and scoped
- [ ] Catalog updates reviewed (if any)
- [ ] Backlog tasks have type, INVEST satisfied, acceptance criteria, estimation, and test plan
- [ ] Subtasks sized appropriately (prefer XS–S scope)
- [ ] Status set to `ready`

---

## Step 6 — Design

| Scope | Basic Design | Detail Design |
|-------|--------------|---------------|
| XS / S | Use project baseline in `06_design/00_project/` | Minimal spec in task **Design** section or one screen/object file |
| M / L | Update function-level docs in `06_design/01_functions/` | Full artifacts per [06_design/README.md](./06_design/README.md) |

Skills: [basic-design](../.cursor/skills/basic-design/SKILL.md), [detail-design](../.cursor/skills/detail-design/SKILL.md).

Link design artifacts from the task **Design** section. Do not implement M+ work without design links.

---

## Step 7 — Develop & Test

- Code in `backend/`, `frontend/`, `infra/` as applicable
- Fill **Implementation** and **UAT / Verification evidence** in backlog task
- Automated tests in `test/` when the project stack is defined
- Develop-phase vendor skills: [.agent/vendor/README.md](../.agent/vendor/README.md)

---

## Step 8 — Report

When task status = `done`, create delivery report under [05_reports/](./05_reports/) — see [report-writer](../.cursor/skills/report-writer/SKILL.md).

---

## Design doc matrix (reference)

| Artifact | Type | Folder |
|----------|------|--------|
| System Overview | Basic | `06_design/00_project/` |
| Architecture (FE / BE) | Basic | `06_design/00_project/` |
| Permission Design | Basic | `06_design/00_project/` |
| Business Flow | Basic | `06_design/01_functions/{slug}/` |
| Screen List / Transition | Basic | `06_design/01_functions/{slug}/` |
| ERD | Basic | `06_design/01_functions/{slug}/` or `03_objects/` |
| Screen Layout | Detail | `06_design/02_screens/{id}/` |
| Fields & Validate | Detail | `06_design/03_objects/{name}/` |
| Logic / Sequence / API | Detail | `06_design/06_logic/`, `04_integrations/` |

See [06_design/README.md](./06_design/README.md) for templates.
