# Backlog

Executable tasks from analyzed requests. Git is the **spec**; external trackers (Redmine, Jira) are for status only — add links in task files as needed.

## Structure

```
backlogs/
├── _task.template.md
├── _subtask.template.md
├── task-{id}/
│   ├── README.md
│   └── subtask-{id}_{slug}.md
└── task-example/
```

### Naming

| Type | Pattern | Example |
|------|---------|---------|
| Task folder | `task-{id}/` | `task-101/` |
| Subtask | `subtask-{parentId}_{slug}.md` | `subtask-101_add-validation.md` |

## Templates

| File | Purpose |
|------|---------|
| [_task.template.md](./_task.template.md) | Parent task |
| [_subtask.template.md](./_subtask.template.md) | Subtask |

### INVEST and task types

Every task must satisfy [INVEST](../.notebook/00_references/invest.md) before status = `ready`.

| Type | Use when |
|------|----------|
| **feature** | New capability or function-list work |
| **bugfix** | Fix a known defect (Prove-It repro) |
| **refactor** | Tech debt; behavior unchanged |
| **deploy** | Release, promote, smoke check |

### Task sections by phase

| Section | Phase | Notes |
|---------|-------|-------|
| Type, Description, Value, INVEST, AC, Estimation, Test plan, Dependencies | **Plan** | INVEST gate before `ready` |
| Design | **Design** | Link `.notebook/06_design/` artifacts; skip trivial **bugfix** / **deploy** |
| Implementation | **Develop** | TDD or deploy runbook by type |
| Review / doubt | **Develop** | Optional for non-trivial work |
| UAT / Verification evidence | **Test** | Commands + results before `done` |
| Definition of done | **Test** | Task AC + [project DoD](../.notebook/00_references/definition-of-done.md) + delivery report |
| Reports | **Report** | Link in task; delivery required at handover |

## Task lifecycle

| Status | Meaning |
|--------|---------|
| `draft` | Being written |
| `ready` | Approved for Design / Develop |
| `in-progress` | Implementation started |
| `done` | Verification passed |

## Workflow

1. Map request to [function-list](../.notebook/02_function-list/) (if applicable).
2. Check [non-functional-requirements](../.notebook/03_non-functional-requirements/).
3. Create `task-{id}/` with spec from template.
4. Split into subtasks if scope is L or larger.
5. After `ready`, complete design links for M+ work.
6. After task `done`, create delivery report under [05_reports](../.notebook/05_reports/task-{id}/) — see [report-writer](../.cursor/skills/report-writer/SKILL.md).
