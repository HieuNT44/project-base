# Notebook — project workflow

Standard layout for planning through handover. Folders are **numbered by workflow order**. Executable tasks live in [`.backlogs/`](../.backlogs/) at repo root.

```
00_references → 01_business-requirements → 02_function-list → 03_non-functional-requirements → 04_wbs
    → .backlogs/{id}/ (draft → ready → design) → 06_design → Develop → Review → Test → Deploy → 05_reports
```

See [.workflow-sldc/01_WORKFLOW.md](../.workflow-sldc/01_WORKFLOW.md) for the full pipeline.

## Folders

| # | Folder | Purpose | Owner |
|---|--------|---------|-------|
| 00 | [00_references/](./00_references/) | Gates & checklists — [INVEST](./00_references/invest.md), [DoD](./00_references/definition-of-done.md), [index](./00_references/README.md) | Lead |
| 01 | [01_business-requirements/](./01_business-requirements/) | Why the project exists, stakeholders, scope IN/OUT | PM / BA |
| 02 | [02_function-list/](./02_function-list/) | Functional catalog — Function, Task, Backlog link, Summary, Outcome | PM / lead |
| 03 | [03_non-functional-requirements/](./03_non-functional-requirements/) | NFR — security, performance, i18n, compliance | Architect / lead |
| 04 | [04_wbs/](./04_wbs/) | WBS — cấu trúc phân rã công việc dự án; link tới [`.backlogs/`](../.backlogs/) | PM / lead |
| 05 | [05_reports/](./05_reports/) | Delivery and progress reports for PM / client | Dev |
| 06 | [06_design/](./06_design/) | Basic + Detail design artifacts | Architect / dev |

## Agent lookup

1. Read this file and [.workflow-sldc/01_WORKFLOW.md](../.workflow-sldc/01_WORKFLOW.md).
2. On new request: optional [interview-me](../.cursor/skills/interview-me/SKILL.md) / [idea-refine](../.cursor/skills/idea-refine/SKILL.md), then [create-task-draft](../.cursor/skills/create-task-draft/SKILL.md).
3. Analyze against folders **01–03**; update catalogs when needed ([spec-driven-development](../.cursor/skills/spec-driven-development/SKILL.md)).
4. Harden tasks ([planning-and-task-breakdown](../.cursor/skills/planning-and-task-breakdown/SKILL.md)) under [`.backlogs/`](../.backlogs/).
5. Design ([design-workflow](../.cursor/skills/design-workflow/SKILL.md)) → `.backlogs/{id}/design/` + [06_design/](./06_design/).
6. Develop → review (PR / human approval) → test (verification evidence) → deploy when applicable.
7. When a task is done, create a delivery report under **05_reports/** and link it in the task **Reports** section.

Raw intake (chat, meetings, external tickets) is **not** stored in this repo.

## Code layout

| Folder | Purpose |
|--------|---------|
| [backend/](../backend/) | API, services — TBD per project |
| [frontend/](../frontend/) | UI — TBD |
| [infra/](../infra/) | IaC, deploy — TBD |
| [test/](../test/) | Automated tests — TBD |
| [script/](../script/) | Repo scripts — TBD |
