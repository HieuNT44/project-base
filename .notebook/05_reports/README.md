# Reports

Structured reports for **PM** and **clients (KH)**, written from the **dev** perspective. Reports **derive** from [backlogs](../../backlogs/) tasks — do not duplicate full specs; summarize outcomes, evidence, and risks in business-friendly language.

## Structure

```
05_reports/
├── templates/                    # Copy from here
│   ├── _task-delivery.template.md
│   ├── _task-progress.template.md
│   ├── _status-progress.template.md
│   ├── _sprint-retro.template.md
│   └── _incident.template.md
├── task-{id}/                    # Reports tied to one backlog task
│   ├── delivery-YYYY-MM-DD.md
│   └── progress-YYYY-MM-DD.md    # optional
└── periodic/                     # Cross-task / time-boxed reports
    ├── status-YYYY-Www.md
    ├── sprint-{n}-retro.md
    └── incident-YYYY-MM-DD-{slug}.md
```

## Report types

| Type | Template | Scope | Typical audience | When |
|------|----------|-------|------------------|------|
| **Task delivery** | `_task-delivery` | One task | PM + KH | Task status = `done` — **required before handover** |
| **Task progress** | `_task-progress` | One task | PM (KH if requested) | Task `in-progress`; blockers or status update |
| **Status / progress** | `_status-progress` | Project / period | PM + KH | Weekly / monthly |
| **Sprint / retro** | `_sprint-retro` | Sprint | PM + team | End of sprint |
| **Incident** | `_incident` | Event | PM + KH (by severity) | Production or serious defect |

## Audience

| Audience | Content emphasis |
|----------|------------------|
| **PM** | Status, blockers, dependencies, technical appendix, verification detail |
| **client (KH)** | Value, outcomes, AC results, UAT summary — minimal jargon |
| **both** | Shared sections for KH + **Phụ lục kỹ thuật (PM)** section in delivery template |

One delivery file can serve both audiences using the template sections. Create separate files (`delivery-…-client.md`) only when wording must differ significantly.

## Workflow

```
backlog task (spec)  →  develop  →  testing (evidence)  →  report (delivery)  →  PM / client
```

1. Complete task spec: AC, UAT / verification evidence, status = `done`.
2. Create `05_reports/task-{id}/delivery-YYYY-MM-DD.md` from [_task-delivery.template.md](./templates/_task-delivery.template.md).
3. Link the report in the task **Reports** section.
4. For **bugfix** production issues, add [_incident.template.md](./templates/_incident.template.md) under `task-{id}/` or `periodic/`.

## Writing rules

- Do **not** invent metrics — use `[Điền số liệu]` when unknown.
- **Root cause** in incident reports = real cause, not symptom; write "Cần điều tra thêm" if unclear.
- Short bullets; 1–2 sentence summary at top.
- Objective tone for incidents — focus on systems, not blame.
- Default language: **Vietnamese**; English when project or client requires.
- Default output: **Markdown** in repo. Word (`.docx`) only when explicitly requested for formal client delivery.

## Agent skill

Use [report-writer](../../.cursor/skills/report-writer/SKILL.md) when generating reports from task specs or raw notes.

## Link from backlogs

Each [task template](../../backlogs/_task.template.md) has a **Reports** table. Keep links bidirectional: task → report, report → task.
