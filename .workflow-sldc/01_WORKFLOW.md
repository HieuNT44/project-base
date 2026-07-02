# WORKFLOW SLDC

Pipeline cho agent và dev — artifact rõ từng phase.

Chi tiết: [02 Define](./02_WORKFLOW_DEFINE.md) → [03 Plan](./03_WORKFLOW_PLAN.md) → [04 Design](./04_WORKFLOW_DESIGN.md)

---

## Mô hình tổng quan

```
INTAKE (bên ngoài — không lưu repo)
    ↓
DEFINE      →  .backlogs/{id}/draft/
    ↓
PLAN        →  .backlogs/{id}/ready/
    ↓
DESIGN      →  .backlogs/{id}/design/
    ↓
DEVELOP     →  code (backend / frontend / infra)
    ↓
REVIEW      →  PR, duyệt
    ↓
TEST        →  verification trong task
    ↓
DEPLOY      →  release / smoke
    ↓
REPORT      →  .notebook/05_reports/
```

---

## Phase

| Phase | Output | Chi tiết |
|-------|--------|----------|
| **Define** | `.backlogs/{id}/draft/{id}.md` | [02_WORKFLOW_DEFINE.md](./02_WORKFLOW_DEFINE.md) |
| **Plan** | `.backlogs/{id}/ready/{id}.md` | [03_WORKFLOW_PLAN.md](./03_WORKFLOW_PLAN.md) |
| **Design** | `.backlogs/{id}/design/{id}.md` | [04_WORKFLOW_DESIGN.md](./04_WORKFLOW_DESIGN.md) |
| **Develop** | `backend/` · `frontend/` · `infra/` | — |
| **Report** | `.notebook/05_reports/` | skill `report-writer` |

Notebook: [`.notebook/README.md`](../.notebook/README.md) · Backlog: [`.backlogs/README.md`](../.backlogs/README.md) · Skills: [`.cursor/skills/README.md`](../.cursor/skills/README.md)

## Skills

| Phase | Skill |
|-------|-------|
| Define | `interview-me` · `idea-refine` · `create-task-draft` |
| Plan | `spec-driven-development` · `planning-and-task-breakdown` |
| Design | `design-workflow` |
| Report | `report-writer` |

Develop / Review / Test: [`.cursor/skills/README.md`](../.cursor/skills/README.md) (Develop & quality)

## Quy tắc

- Không lưu intake thô trong repo
- `ready` chỉ sau INVEST + duyệt (Plan)
- M+ scope: cần `.backlogs/{id}/design/{id}.md` trước khi code
