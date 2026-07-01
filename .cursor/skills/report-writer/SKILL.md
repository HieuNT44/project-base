---
name: report-writer
description: Soạn báo cáo cho dự án phần mềm — task delivery/progress, status, sprint/retro, incident — theo mẫu trong .notebook/05_reports/. Dùng khi yêu cầu "viết báo cáo", "báo cáo tiến độ", "bàn giao task", "incident report", "retro sprint", hoặc có thông tin rời rạc cần thành báo cáo có cấu trúc. Mặc định markdown trong repo; Word (.docx) chỉ khi user yêu cầu rõ.
---

# Report Writer

Tổng hợp thông tin thô (ghi chú, backlog task, log lỗi…) thành báo cáo có cấu trúc cho **PM** và **KH**, từ góc nhìn **dev**.

## When to Use

- Task `done` → viết **task delivery** report
- Task `in-progress` + cần update → **task progress**
- Báo cáo tuần/tháng → **status / progress**
- Cuối sprint → **sprint / retro**
- Sự cố production → **incident** (thường gắn task `bugfix`)

**When NOT to use:** Chỉ cần cập nhật spec kỹ thuật trong backlog — dùng backlog templates, không tạo report.

## Step 1 — Read project layout

1. [.notebook/05_reports/README.md](../../.notebook/05_reports/README.md) — types, audience, workflow
2. Template trong [.notebook/05_reports/templates/](../../.notebook/05_reports/templates/)
3. Nguồn: [backlogs/task-{id}/README.md](../../backlogs/) — Value, AC, UAT evidence

## Step 2 — Chọn loại báo cáo

| Loại | Template | Output path |
|------|----------|-------------|
| Task delivery | `_task-delivery.template.md` | `.notebook/05_reports/task-{id}/delivery-YYYY-MM-DD.md` |
| Task progress | `_task-progress.template.md` | `.notebook/05_reports/task-{id}/progress-YYYY-MM-DD.md` |
| Status / progress | `_status-progress.template.md` | `.notebook/05_reports/periodic/status-YYYY-Www.md` |
| Sprint / retro | `_sprint-retro.template.md` | `.notebook/05_reports/periodic/sprint-{n}-retro.md` |
| Incident | `_incident.template.md` | `.notebook/05_reports/task-{id}/` hoặc `.notebook/05_reports/periodic/` |

Nếu không rõ loại: hỏi 1 câu hoặc suy từ ngữ cảnh (task xong → delivery; server sập → incident).

## Step 3 — Audience

| Audience | Viết gì |
|----------|---------|
| **PM** | Blockers, dependencies, phụ lục kỹ thuật, verification chi tiết |
| **client (KH)** | Value, outcome, AC đã đạt, UAT — tránh jargon |
| **both** | Section chung cho KH + **Phụ lục kỹ thuật (PM)** |

## Step 4 — Điền nội dung

### Task delivery (từ backlog)

Map trực tiếp:

| Report section | Nguồn trong task |
|----------------|------------------|
| Giá trị đã giao | **Value** + function-list Outcome |
| Nội dung hoàn thành | **Acceptance criteria** (checked) |
| Kiểm tra / UAT | **UAT / Verification evidence** |
| Phụ lục kỹ thuật | **Files / artifacts**, test commands, deploy |

### Status / sprint

Mỗi bullet **link** tới `backlogs/task-{id}/README.md`. Ghi status: draft | ready | in-progress | done.

### Incident

- Root cause = nguyên nhân thật, không triệu chứng
- Link task bugfix nếu có
- Giọng khách quan

## Step 5 — Nguyên tắc

- Không bịa số liệu — dùng `[Điền số liệu]`
- Bullet ngắn; tóm tắt 1–2 câu
- Tiếng Việt mặc định; English nếu dự án/KH yêu cầu
- Mặc định: tạo file `.md` trong repo

## Step 6 — Sau khi tạo file

1. Cập nhật bảng **Reports** trong task backlog (`backlogs/task-{id}/README.md`)
2. Delivery report **bắt buộc** trước khi coi task đã bàn giao PM/KH (task vẫn `done` về kỹ thuật)

## Output format

- **Markdown** — mặc định, lưu `.notebook/05_reports/`
- **Word (.docx)** — chỉ khi user nói rõ "file Word", "gửi khách hàng", deliverable trang trọng
