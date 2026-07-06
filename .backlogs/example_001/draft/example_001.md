# Tích hợp tính năng Theo dõi trạng thái vận chuyển đơn hàng

**ID:** example_001  
**Path:** `.backlogs/example_001/draft/` → `ready/` → `design/`  
**Type:** feature  
**Function:** Đơn hàng _(xem `.notebook/02_function-list/`)_  
**Status:** draft  
**Estimate:** —  
**Assignee:** —  
**Subtasks:** không

> Ví dụ task thật theo [`.backlogs/_task.template.md`](../../_task.template.md). Xóa `example_001/` khi có task production.

---

## 0. Nguồn đầu vào (Intake)

_(Tóm tắt đã xử lý — **không** dán nguyên chat/họp/ticket vào repo. Link tracker ngoài.)_

| Nguồn | Link / vị trí | Ngày | Tóm tắt |
|-------|---------------|------|---------|
| Redmine #1234 | https://redmine.example.com/issues/1234 | 2026-06-18 | KH phàn nàn: mua xong không biết đơn đang ở đâu, muốn xem trạng thái như Shopee |
| Biên bản họp sprint | _(Notion — ngoài repo)_ | 2026-06-20 | PM ưu tiên MVP timeline trên Chi tiết đơn hàng; carrier phase 1: GHN |

**Yêu cầu gốc (rút gọn):** *"Khách hàng phàn nàn mua hàng xong không biết đơn hàng đang ở đâu, muốn có chỗ xem trạng thái vận chuyển giống Shopee."*

---

## 1. Mô tả bài toán (User Story)

As a: Khách hàng đã mua sản phẩm trên hệ thống.  
I want to: Xem lộ trình và trạng thái vận chuyển chi tiết của đơn hàng (Đang chuẩn bị, Đang giao, Đã giao).  
So that: Chủ động biết khi nào hàng đến để nhận, giảm lo lắng và giảm tỷ lệ gọi hotline hỗ trợ.

## 2. Mô tả & Nhiệm vụ

- Hiển thị timeline vận chuyển trên trang Chi tiết đơn hàng.
- Đồng bộ mã vận đơn (Tracking ID) qua API đối tác vận chuyển (GHN / GHTK / Viettel Post — chốt ở Plan).
- UI: link Figma timeline _(TBD)_.

## 3. Luồng xử lý chính (User Flow & Happy Path)

1. Người dùng vào mục **Đơn hàng của tôi**.
2. Bấm vào một đơn hàng cụ thể để xem **Chi tiết đơn hàng**.
3. Hệ thống hiển thị timeline các mốc vận chuyển (thời gian + trạng thái).

## 4. Tiêu chí nghiệm thu (Acceptance Criteria)

AC 1: Hiển thị trục mốc thời gian vận chuyển  
Given: Người dùng đang ở trang Chi tiết đơn hàng.  
When: Đơn hàng đã được bàn giao cho đơn vị vận chuyển.  
Then: Hệ thống hiển thị timeline với các trạng thái cập nhật theo thời gian thực.

AC 2: Đơn hàng bị hủy  
Given: Người dùng đang xem đơn hàng.  
When: Đơn hàng bị hủy (hết hàng hoặc khách hủy).  
Then: Timeline hiển thị trạng thái **Đã hủy** kèm lý do (nếu có).

AC 3: Chưa có thông tin vận chuyển  
Given: Đơn hàng mới tạo thành công.  
When: Cửa hàng chưa đóng gói và chưa giao shipper.  
Then: Timeline chỉ hiển thị mốc **Đơn hàng đã đặt thành công**.

## 5. Tiêu chí hoàn thành

_(Plan chốt — draft để trống.)_

## 6. TTD (test case)

_(Plan bổ sung — có thể nháp sau khi chốt API đối tác.)_

## 7. Non-functional _(tuỳ chọn)_

- Cập nhật trạng thái gần real-time _(tham chiếu `.notebook/03_non-functional-requirements/`)_.

## 8. References

| Tài liệu | Link | Dùng để |
|----------|------|---------|
| Scope dự án | `.notebook/01_business-requirements/` | Kiểm tra in-scope |
| Function list | `.notebook/02_function-list/` | Nhóm Đơn hàng |
| NFR | `.notebook/03_non-functional-requirements/` | Real-time, tích hợp API |
| Figma timeline | _(TBD)_ | UI |
