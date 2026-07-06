# Tích hợp tính năng Theo dõi trạng thái vận chuyển đơn hàng

**ID:** example_001  
**Path:** `.backlogs/example_001/ready/example_001.md`  
**Type:** feature  
**Function:** Đơn hàng  
**Status:** ready  
**Estimate:** 16 h  
**Assignee:** —  
**Subtasks:** có (2 subtask)

> Bản Plan — từ [draft](../draft/example_001.md). Ví dụ minh hoạ; xóa khi có task thật.

---

## 0. Nguồn đầu vào (Intake)

| Nguồn | Link / vị trí | Ngày | Tóm tắt |
|-------|---------------|------|---------|
| Redmine #1234 | https://redmine.example.com/issues/1234 | 2026-06-18 | KH: theo dõi vận chuyển như Shopee |
| Biên bản họp | _(Notion)_ | 2026-06-20 | MVP timeline D004; GHN phase 1 |

---

## 1. Mô tả bài toán (User Story)

As a: Khách hàng đã mua sản phẩm trên hệ thống.  
I want to: Xem lộ trình và trạng thái vận chuyển chi tiết của đơn hàng (Đang chuẩn bị, Đang giao, Đã giao).  
So that: Chủ động biết khi nào hàng đến để nhận, giảm lo lắng và giảm tỷ lệ gọi hotline hỗ trợ.

## 2. Mô tả & Nhiệm vụ

**Backend**
- API lấy timeline vận chuyển theo `order_id` (gọi GHN API — carrier chốt phase 1).
- Lưu cache snapshot trạng thái; webhook hoặc polling cập nhật _(chốt ở design)_.

**Frontend**
- Component timeline trên màn Chi tiết đơn hàng (`D004`).
- Trạng thái: đang tải, có dữ liệu, chưa ship, đã hủy.

## 3. Luồng xử lý chính (User Flow & Happy Path)

1. Người dùng vào **Đơn hàng của tôi** → **Chi tiết đơn hàng**.
2. FE gọi `GET /api/v1/orders/{id}/shipment-timeline`.
3. Hiển thị timeline theo thứ tự thời gian.

**Edge:** Đơn chưa giao shipper → một mốc; đơn hủy → mốc đỏ + lý do.

## 4. Tiêu chí nghiệm thu (Acceptance Criteria)

AC 1: Timeline khi đã giao shipper  
Given: Đơn có tracking ID và GHN trả về ≥ 2 mốc.  
When: Mở Chi tiết đơn hàng.  
Then: Timeline hiển thị đủ mốc, đúng thứ tự thời gian.

AC 2: Đơn hủy  
Given: Đơn status = `cancelled`.  
When: Mở Chi tiết đơn hàng.  
Then: Hiển thị **Đã hủy** + lý do nếu BE có.

AC 3: Chưa có vận chuyển  
Given: Đơn mới, chưa có tracking.  
When: Mở Chi tiết đơn hàng.  
Then: Chỉ mốc **Đã đặt hàng thành công**.

## 5. Tiêu chí hoàn thành

- [ ] AC 1–3 pass
- [ ] TTD T1–T4 pass
- [ ] Review / merge
- [ ] Smoke trên staging
- [ ] [Báo cáo bàn giao](../../../.notebook/05_reports/) khi `done`

## 6. TTD (test case)

| ID | Case | Loại | Kỳ vọng | Kết quả |
|----|------|------|---------|---------|
| T1 | Timeline đủ mốc | integration | AC 1 | — |
| T2 | Đơn hủy | integration | AC 2 | — |
| T3 | Chưa có tracking | integration | AC 3 | — |
| T4 | Timeline UI | manual / e2e | Khớp Figma, responsive | — |

## 7. Non-functional

- API timeline p95 < 500ms _(NFR-02)_.
- Chỉ chủ đơn hoặc admin xem được timeline _(matrix-design)_.

## 8. References

| Tài liệu | Link | Dùng để |
|----------|------|---------|
| Draft | [example_001.md](../draft/example_001.md) | Define |
| Scope | `.notebook/01_business-requirements/` | In-scope |
| Screen list | `.notebook/06_design/basic-design/screen-list/` | D004 |
| Intake | [draft §0](../draft/example_001.md#0-nguồn-đầu-vào-intake) | Redmine #1234 |

---

## Plan — Todo

| # | Việc | h | Ai | Sau # | ✓ |
|---|------|---|-----|-------|---|
| 1 | Design API + sequence GHN | 4 | BE | — | [ ] |
| 2 | Subtask BE: API + tích hợp GHN | 8 | BE | 1 | [ ] |
| 3 | Subtask FE: Timeline UI D004 | 6 | FE | 1 | [ ] |
| 4 | E2E + báo cáo bàn giao | 2 | QA/Dev | 2, 3 | [ ] |

**Notebook:** in-scope ✓ · function-list: row Đơn hàng · cập nhật `01`–`03`: không

## Subtasks

| Subtask | File | h | Status |
|---------|------|---|--------|
| API shipment timeline | [example_001_api.md](./example_001_api.md) | 8 | draft |
| FE timeline D004 | [example_001_fe.md](./example_001_fe.md) | 6 | draft |
