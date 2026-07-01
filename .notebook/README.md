# Notebook — project workflow

Standard layout for planning through handover. Folders are **numbered by workflow order**. Executable tasks live in [`backlogs/`](../backlogs/) at repo root.

```
00_references → 01_business-requirements → 02_function-list → 03_non-functional-requirements
    → backlogs (ready) → 06_design → Develop → 05_reports
```

See [workflow.md](./workflow.md) for the full pipeline.

## Folders

| # | Folder | Purpose | Owner |
|---|--------|---------|-------|
| 00 | [00_references/](./00_references/) | Standing gates — [INVEST](./00_references/invest.md), [Definition of Done](./00_references/definition-of-done.md) | Lead |
| 01 | [01_business-requirements/](./01_business-requirements/) | Why the project exists, stakeholders, scope IN/OUT | PM / BA |
| 02 | [02_function-list/](./02_function-list/) | Functional catalog — Function, Task, Backlog link, Summary, Outcome | PM / lead |
| 03 | [03_non-functional-requirements/](./03_non-functional-requirements/) | NFR — security, performance, i18n, compliance | Architect / lead |
| 04 | [backlogs-index/](./backlogs-index/) | Index and conventions — tasks in [`backlogs/`](../backlogs/) | Dev / agent |
| 05 | [05_reports/](./05_reports/) | Delivery and progress reports for PM / client | Dev |
| 06 | [06_design/](./06_design/) | Basic + Detail design artifacts | Architect / dev |

## Agent lookup

1. Read this file and [workflow.md](./workflow.md).
2. On new request: optional [interview-me](../.cursor/skills/interview-me/SKILL.md) / [idea-refine](../.cursor/skills/idea-refine/SKILL.md), then [analyze-intake-to-task](../.cursor/skills/analyze-intake-to-task/SKILL.md).
3. Analyze against folders **01–03**; update catalogs when needed ([spec-driven-development](../.cursor/skills/spec-driven-development/SKILL.md)).
4. Harden tasks ([planning-and-task-breakdown](../.cursor/skills/planning-and-task-breakdown/SKILL.md)) under [`backlogs/`](../backlogs/).
5. Design ([basic-design](../.cursor/skills/basic-design/SKILL.md) / [detail-design](../.cursor/skills/detail-design/SKILL.md)) → [06_design/](./06_design/).
6. When a task is done, create a delivery report under **05_reports/** and link it in the task **Reports** section.

Raw intake (chat, meetings, external tickets) is **not** stored in this repo.

## Code layout

| Folder | Purpose |
|--------|---------|
| [backend/](../backend/) | API, services — TBD per project |
| [frontend/](../frontend/) | UI — TBD |
| [infra/](../infra/) | IaC, deploy — TBD |
| [test/](../test/) | Automated tests — TBD |
| [script/](../script/) | Repo scripts — TBD |
