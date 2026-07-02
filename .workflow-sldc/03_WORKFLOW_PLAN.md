# WORKFLOW PLAN

**Mục đích:** Biến task nháp thành task **đủ điều kiện để làm**, có PM/lead duyệt.

Tham chiếu: [01_WORKFLOW.md](./01_WORKFLOW.md) · [02_WORKFLOW_DEFINE.md](./02_WORKFLOW_DEFINE.md)

### Việc làm

1. Đọc lại task nháp + tài liệu dự án
2. Làm rõ việc cụ thể (backend, frontend, API…)
3. Bổ sung trường hợp đặc biệt / cách tái hiện lỗi (nếu sửa bug)
4. Chốt điều kiện nghiệm thu — kiểm tra được pass/fail
5. Viết bảng test case (mục §6 trong task)
6. Viết checklist hoàn thành (mục §5)
7. Ước thời gian; nếu > 8 giờ → tách subtask
8. Lập **Plan — Todo**: thứ tự, giờ, người làm, phụ thuộc
9. Cập nhật notebook `01`–`03` nếu phạm vi thay đổi
10. PM/lead review → chuyển `ready`

### Skills


| Việc                      | Skill                                                                                |
| ------------------------- | ------------------------------------------------------------------------------------ |
| Cập nhật catalog dự án    | [spec-driven-development](../.cursor/skills/spec-driven-development/SKILL.md)         |
| Chia việc, AC, test, Todo | [planning-and-task-breakdown](../.cursor/skills/planning-and-task-breakdown/SKILL.md) |


---

## 1) Input

Task **draft**: `.backlogs/{id}/draft/{id}.md` (từ Define / [create-task-draft](../.cursor/skills/create-task-draft/SKILL.md)).

Đọc thêm notebook `01`–`03`. Gate nội bộ: [INVEST](../.notebook/00_references/invest.md) (không cần section riêng trên task).

---

## 2) Output


| Artifact | Trạng thái |
| -------- | ---------- |
| `.backlogs/{id}/ready/{id}.md` | **ready** |


---

## 3) STEP


| #   | Bước              | Bắt buộc                                  | Việc cần làm                                  | Đầu ra                           | Skill (Cursor)                |
| --- | ----------------- | ----------------------------------------- | --------------------------------------------- | -------------------------------- | ----------------------------- |
| 1   | Đọc & đối chiếu   | **Bắt buộc**                              | Đọc task `draft`; rà notebook `01`–`03`       | Ghi dòng **Notebook** trong Todo | —                             |
| 2   | Cập nhật notebook | Tuỳ chọn *(khi scope/NFR/capability đổi)* | Sửa `01`–`03`; **Backlog** trên `02` nếu có   | Diff notebook đã review          | `spec-driven-development`     |
| 3   | Làm rõ phạm vi    | **Bắt buộc**                              | Bóc tách §2; bổ sung §3 edge / repro          | §2–§3 chốt                       | `planning-and-task-breakdown` |
| 4   | Chốt AC & TTD     | **Bắt buộc**                              | §4 G/W/T testable; §6 test case; §5 checklist | AC + TTD + Tiêu chí hoàn thành   | `planning-and-task-breakdown` |
| 5   | Ước lượng & Todo  | **Bắt buộc**                              | Tổng ≤ 8h hoặc tách subtask; bảng Todo        | Estimate · Todo · Subtasks       | `planning-and-task-breakdown` |
| 6   | Duyệt → ready     | **Bắt buộc**                              | PM/lead review                                | Status → **ready**             | —                             |


---

## 4) Ví dụ task ready

Cùng bài toán [task draft Shopee](./02_WORKFLOW_DEFINE.md#5-ví-dụ-task-draft) sau Plan — **cùng khung 8 mục**, chỉ làm rõ và thêm Todo:

```markdown
# Tích hợp tính năng Theo dõi trạng thái vận chuyển của đơn hàng

**ID:** DEV_001 | **Type:** feature | **Status:** ready
**Function:** Đơn hàng — Chi tiết đơn | **Estimate:** 6 h | **Assignee:** @dev-a | **Subtasks:** không

## 1. Mô tả bài toán (User Story)

As a: Khách hàng đã mua sản phẩm trên hệ thống.
I want to: Xem được lộ trình và trạng thái vận chuyển chi tiết của đơn hàng (Đang chuẩn bị, Đang giao, Đã giao).
So that: Chủ động biết khi nào hàng đến để nhận, giảm lo lắng và giảm tỷ lệ gọi hotline hỗ trợ.

## 2. Mô tả & Nhiệm vụ

- **BE:** Client API GHN — map tracking ID → model `ShipmentStatus`; webhook/poll cập nhật mốc.
- **FE:** Component Timeline trên Chi tiết đơn hàng; 3 trạng thái đặc biệt: chưa ship, đang giao, đã hủy.
- **Out of scope:** Đổi đơn vị vận chuyển; thông báo push (phase sau).

## 3. Luồng xử lý chính (User Flow & Happy Path)

1. Đơn hàng của tôi → Chi tiết đơn hàng.
2. Nếu đã có tracking ID → hiển thị timeline (thời gian + trạng thái).
3. Edge: chưa có tracking → một mốc "Đã đặt thành công".
4. Edge: đơn hủy → timeline đỏ + lý do.

## 4. Tiêu chí nghiệm thu (Acceptance Criteria)

AC 1: Timeline khi đã bàn giao shipper
Given: Người dùng ở Chi tiết đơn hàng.
When: Đơn đã có tracking ID và ≥ 2 mốc từ API.
Then: Timeline hiển thị đủ mốc, sắp xếp theo thời gian tăng dần.

AC 2: Đơn hủy
Given: Đơn status = cancelled.
When: Mở Chi tiết đơn hàng.
Then: Timeline đỏ, mốc cuối "Đã hủy" + `cancelReason`.

AC 3: Chưa có vận chuyển
Given: Đơn mới, chưa tracking ID.
When: Mở Chi tiết đơn hàng.
Then: Chỉ một mốc "Đơn hàng đã đặt thành công".

## 5. Tiêu chí hoàn thành

- [ ] AC 1–3 pass
- [ ] TTD T1–T3 pass
- [ ] Review / merge PR
- [ ] Báo cáo bàn giao khi `done`

## 6. TTD (test case)

| ID | Case | Loại | Kỳ vọng | Kết quả |
|----|------|------|---------|---------|
| T1 | Đơn có 2+ mốc GHN | e2e | Timeline đúng thứ tự | — |
| T2 | Đơn cancelled | e2e | Đỏ + lý do | — |
| T3 | Đơn chưa tracking | unit | 1 mốc default | — |

## 7. Non-functional _(optional)_

Poll/webhook cập nhật mốc mới trong ≤ 30s (`.notebook/03_non-functional-requirements/`).

## 8. References

| Tài liệu | Link | Dùng để |
|----------|------|---------|
| Scope | .notebook/01_business-requirements/ | In-scope |
| Function-list | .notebook/02_function-list/ — Đơn hàng | Row + Backlog link |
| NFR | .notebook/03_non-functional-requirements/ | Real-time |
| API GHN | https://api.ghn.vn/docs/tracking | Contract |
| Figma | [link timeline v1] | UI |
| Ticket | JIRA-4521 | Yêu cầu gốc |

---

## Plan — Todo

| # | Việc | h | Ai | Sau # | ✓ |
|---|------|---|-----|-------|---|
| 1 | GHN client + model ShipmentStatus | 2 | @dev-a | — | [ ] |
| 2 | API nội bộ GET order/shipment | 1.5 | @dev-a | 1 | [ ] |
| 3 | UI Timeline + 3 edge states | 2 | @dev-a | 2 | [ ] |
| 4 | e2e T1–T3 | 0.5 | @dev-a | 3 | [ ] |

**Notebook:** in-scope ✓ · function-list: row Đơn hàng · cập nhật `01`–`03`: không

## Subtasks

_(Estimate 6 h ≤ 8 h — không tách.)_
```

**Bước tiếp:** Design — [04_WORKFLOW_DESIGN.md](./04_WORKFLOW_DESIGN.md) → `.backlogs/{id}/design/`
