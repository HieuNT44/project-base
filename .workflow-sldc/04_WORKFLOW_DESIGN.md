# WORKFLOW DESIGN

Biến **task ready** thành **file design** — input cho phase Code.

Tham chiếu: [01_WORKFLOW.md](./01_WORKFLOW.md) · [03_WORKFLOW_PLAN.md](./03_WORKFLOW_PLAN.md) · Skill: [design-workflow](../.cursor/skills/design-workflow/SKILL.md)

---

## Mục tiêu

Có file `.backlogs/{id}/design/{id}.md` đủ để dev/AI hiểu yêu cầu và bắt đầu code.

---

## Input / Output


|            | Path                                                                          |
| ---------- | ----------------------------------------------------------------------------- |
| **Input**  | `.backlogs/{id}/ready/{id}.md` · `.notebook/01`–`03` · `.notebook/06_design/` |
| **Output** | `.backlogs/{id}/design/{id}.md` (+ cập nhật file trong `06_design/` nếu cần)  |


Template file design: [.backlogs/_design.template.md](../.backlogs/_design.template.md)

---

## STEP


| #   | Việc                 | Làm gì                                                                                                   |
| --- | -------------------- | -------------------------------------------------------------------------------------------------------- |
| 1   | **Check yêu cầu**    | Đọc task ready → xác định cần xem file design nào trong `06_design/`                                     |
| 2   | **Đề xuất tài liệu** | Mỗi file: `skip` · chỉ đọc · sửa · tạo mới? phần nào ảnh hưởng logic code?                               |
| 3   | **Kế hoạch cơ bản**  | Thứ tự làm: doc nào trước, làm gì tiếp (ngắn)                                                            |
| 4   | **Ghi file design**  | Sửa/tạo doc `06_design/` (theo bước 2) + **handoff Code**: thứ tự code, file code, link doc, AC → module |


---

## Nội dung file `design/{id}.md`

```markdown
## 1. Tài liệu design
## 2. Kế hoạch triển khai (cơ bản)
## 3. Handoff — Code
```

---

## Sang phase Code

Có `.backlogs/{id}/design/{id}.md` với section **Handoff — Code** đủ (thứ tự code, file code, link tài liệu).

**Bước tiếp:** Develop — đọc `{id}/design/{id}.md`
