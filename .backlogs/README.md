# Backlog

Executable tasks from analyzed requests. Git is the **spec**; external trackers (Redmine, Jira) are for status only — add links in task **References**.

## Structure

```
.backlogs/
├── _task.template.md
├── _subtask.template.md
├── _design.template.md
├── example_001/
│   ├── draft/example_001.md
│   ├── ready/example_001.md
│   └── design/example_001.md
└── {id}/                    ← ví dụ DEV_001
    ├── draft/{id}.md        ← Define
    ├── ready/{id}.md        ← Plan
    └── design/{id}.md       ← Design (input cho Code)
```

### Path theo phase

| Phase | Output | Path |
|-------|--------|------|
| **Define** | Task nháp | `.backlogs/{id}/draft/{id}.md` |
| **Plan** | Task sẵn sàng | `.backlogs/{id}/ready/{id}.md` |
| **Design** | Bàn giao code | `.backlogs/{id}/design/{id}.md` |
| **Develop** | Code | Đọc **design** + **ready** (AC · TTD · Todo) |

Plan: copy/sinh `draft/{id}.md` → `ready/{id}.md`. Design: tạo `design/{id}.md` — link tới ready và `.notebook/06_design/`.

### Naming

| Type | Pattern | Example |
|------|---------|---------|
| Task folder | `{id}/` | `DEV_001/` · `example_001/` |
| Task file | `{id}.md` trong `draft/` · `ready/` · `design/` | `DEV_001/draft/DEV_001.md` |
| Subtask | `{id}_{slug}.md` cùng folder phase | `DEV_001/ready/DEV_001_api.md` |

## Task khung (mục 0 + 8 mục)

Một file task — draft và ready **cùng skeleton**; Plan chỉ làm rõ và thêm **Todo**.

| # | Mục | Define (`draft`) | Plan (`ready`) |
|---|-----|------------------|----------------|
| — | **Metadata** | ID, Type, Status `draft` | + Estimate ≤ 8h, Assignee, Subtasks |
| 0 | Nguồn đầu vào (Intake) | Tóm tắt + link ticket _(không lưu bản gốc)_ | Bổ sung nguồn nếu có |
| 1 | Mô tả bài toán (User Story) | As / I want / So that | Giữ; sửa nếu cần |
| 2 | Mô tả & Nhiệm vụ | Mô tả làm gì | Bóc tách bullet cụ thể |
| 3 | Luồng xử lý | Happy path | + edge; bug → repro steps |
| 4 | Tiêu chí nghiệm thu | G/W/T nháp | Chốt, testable |
| 5 | Tiêu chí hoàn thành | Có thể trống | Checklist ngắn |
| 6 | TTD (test case) | Tuỳ chọn | Bắt buộc |
| 7 | Non-functional | Optional | Nếu liên quan `03` NFR |
| 8 | References | Link notebook, ticket, Figma | Bổ sung đủ để làm |
| + | **Plan — Todo** | — | h, thứ tự, ai, phụ thuộc |
| + | **Subtasks** | — | Nếu tổng > 8h |

File **design** dùng [_design.template.md](./_design.template.md) — 3 section: Tài liệu design · Kế hoạch · Handoff — Code.

Gate `ready`: Estimate ≤ 8h (hoặc đã tách subtask) · AC chốt · TTD có · Todo đầy đủ · PM/lead duyệt. Chi tiết [INVEST](../.notebook/00_references/invest.md).

### Task types

| Type | Use when | Khác biệt mục 3 |
|------|----------|-----------------|
| **feature** | Capability mới | User flow + happy path |
| **bugfix** | Sửa lỗi | Steps to reproduce + Expected vs Actual |
| **refactor** | Tech debt; hành vi không đổi | Phạm vi refactor |
| **deploy** | Release, smoke | Runbook tóm tắt |

### Phase sau (tracking)

| Phase | File chính |
|-------|------------|
| **Design** | `{id}/design/{id}.md` |
| **Develop** | Đọc design; tick Todo + TTD trên **ready** |
| **Test** | Tick §5 trên **ready** |
| **Report** | Link trong §5 hoặc §8 **ready** khi `done` |

## Task lifecycle

| Status | Meaning | File |
|--------|---------|------|
| `draft` | Define xong — chờ Plan | `{id}/draft/{id}.md` |
| `ready` | Plan + duyệt | `{id}/ready/{id}.md` |
| `in-progress` | Đang làm | metadata trên **ready** |
| `done` | §5 pass | **ready** |

Design file: hoàn thành khi section **Handoff — Code** đủ.

## Workflow

1. [02_WORKFLOW_DEFINE.md](../.workflow-sldc/02_WORKFLOW_DEFINE.md) → `{id}/draft/` ([create-task-draft](../.cursor/skills/create-task-draft/SKILL.md))
2. [03_WORKFLOW_PLAN.md](../.workflow-sldc/03_WORKFLOW_PLAN.md) → `{id}/ready/` ([planning-and-task-breakdown](../.cursor/skills/planning-and-task-breakdown/SKILL.md))
3. [04_WORKFLOW_DESIGN.md](../.workflow-sldc/04_WORKFLOW_DESIGN.md) → `{id}/design/` ([design-workflow](../.cursor/skills/design-workflow/SKILL.md))
4. Develop → Test → Deploy → Report ([01_WORKFLOW.md](../.workflow-sldc/01_WORKFLOW.md))
