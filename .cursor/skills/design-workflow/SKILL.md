---
name: design-workflow
description: Design phase — check task, propose 06_design docs, basic plan, write .backlogs/{id}/design/{id}.md for Code. Use when {id}/ready/{id}.md exists. Follow 04_WORKFLOW_DESIGN.md.
---

# Design Workflow

Theo [04_WORKFLOW_DESIGN.md](../../.workflow-sldc/04_WORKFLOW_DESIGN.md). **Mục tiêu:** `.backlogs/{id}/design/{id}.md` — input cho phase Code.

## When to Use

- `.backlogs/{id}/ready/{id}.md` tồn tại
- Trước code / `in-progress`

**When NOT:** Chưa có **ready** → [planning-and-task-breakdown](./planning-and-task-breakdown/SKILL.md).

## Pipeline

```
ready → (1) Check → (2) Đề xuất → (3) Plan → (4) design/{id}.md → Code
```

---

## INPUT

| Nguồn | Path |
|-------|------|
| Task ready | `.backlogs/{id}/ready/{id}.md` |
| Notebook | `.notebook/01`–`03` |
| Design hiện có | `.notebook/06_design/` |

---

## Step 1 — Check yêu cầu

1. Đọc task ready (AC, luồng, Todo, TTD, §8 References)
2. Đối chiếu `.notebook/01`–`03`
3. Dùng checklist **Q0–Q8** để biết file nào trong `06_design/` cần xem:

| Q | Câu hỏi | Nếu **Có** → tài liệu |
|---|---------|------------------------|
| Q0 | Đụng phạm vi / boundary dự án? | BD: `system-overview` |
| Q1 | Màn hình / UI mới hoặc đổi màn? | BD: `screen-list`, `screen-flow` · DD: `fields-validation-messages` |
| Q2 | Đổi stack / cấu trúc FE? | BD: `architecture-fe` |
| Q3 | API / service mới hoặc đổi contract? | BD: `architecture-be`, `api-error-handling` · DD: `api-document`, `sequence-diagram` |
| Q4 | DB (bảng, cột, quan hệ)? | DD: `database-erd` → `table-definition` → `data-dictionary` |
| Q5 | Tích hợp hệ thống ngoài? | BD: `external-interface-overview` · DD: `interface-specification` |
| Q6 | Job / batch nền? | BD: `batch-overview` · DD: `batch-design` |
| Q7 | Phân quyền theo role? | BD: `matrix-design` |
| Q8 | Rule nghiệp vụ phức tạp? | DD: `logic-design` · có thể `class-design` |

Path BD: `.notebook/06_design/basic-design/` · DD: `detail-design/`. Chi tiết template: [06_design/README.md](../../.notebook/06_design/README.md).

---

## Step 2 — Đề xuất tài liệu

Với mỗi file từ Step 1, ghi vào section **1. Tài liệu design** (sẽ ghi file ở Step 4):

| Action | Khi nào |
|--------|---------|
| `skip` | Q = Không / không liên quan task |
| `read-only` | Chỉ tham chiếu, không đổi |
| `create` | File chưa có |
| `update` | File có, task đổi nội dung |

Thêm cột **Ảnh hưởng code** — phần logic/API/UI nào dev cần implement.

Tạo sớm `.backlogs/{id}/design/{id}.md` từ [_design.template.md](../../.backlogs/_design.template.md) — điền section 1.

---

## Step 3 — Kế hoạch triển khai (cơ bản)

Ghi section **2. Kế hoạch triển khai** — thứ tự ngắn (3–8 bullet):

1. BD trước DD khi phụ thuộc (vd: `screen-list` trước `fields`)
2. Thứ tự BD: `system-overview` → `architecture-fe`/`architecture-be` → `screen-list` → `screen-flow` → `matrix-design` → `api-error-handling` → `batch-overview` → `external-interface-overview`
3. Thứ tự DD: data (erd → table → dictionary) · API (interface-spec → api-document → sequence) · logic · UI fields · batch

Scope **S**: có thể toàn `skip` ở section 1, plan + handoff ngắn.

---

## Step 4 — Ghi file design

### 4a. Cập nhật `06_design/` (theo Step 2)

- `create`: copy `_*.template.md` → bỏ prefix `_`
- `update` / `read-only` theo plan
- Link task `{id}` — **không** copy nguyên AC vào design doc

Hướng dẫn: [basic-design/README.md](../../.notebook/06_design/basic-design/README.md) · [detail-design/README.md](../../.notebook/06_design/detail-design/README.md)

### 4b. Section **3. Handoff — Code**

| Mục | Nội dung |
|-----|----------|
| Thứ tự code | Theo Todo ready, cụ thể hơn |
| File code | `backend/` · `frontend/` · `infra/` dự kiến |
| AC → doc/module | Mỗi AC trỏ doc hoặc module |
| Link | [ready task](../ready/{id}.md) + path artifacts §1 |

**Không code** trong phase này.

---

## OUTPUT

| Output | Path |
|--------|------|
| File design | `.backlogs/{id}/design/{id}.md` |
| Doc phụ | `.notebook/06_design/` (nếu `create`/`update`) |

## Verification

- [ ] Q0–Q8 đã xem (kể cả `skip`)
- [ ] Section 1–3 trong file design đủ
- [ ] Handoff có thứ tự code + file code
- [ ] Chưa code `backend/` `frontend/` `infra/`

## Red flags

- DD trước BD liên quan (fields trước screen-list)
- API doc không khớp `api-error-handling`
- Copy full AC vào `06_design/` thay vì link ready

## See also

- [04_WORKFLOW_DESIGN.md](../../.workflow-sldc/04_WORKFLOW_DESIGN.md)
