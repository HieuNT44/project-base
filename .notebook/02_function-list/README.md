# Danh sách chức năng

**Catalog chức năng** — hệ thống làm được những gì. Tài liệu tham chiếu ổn định khi phân tích yêu cầu mới.

Chi tiết thực thi nằm ở [backlog](../../.backlogs/). WBS (cây phase/module): [04_wbs](../04_wbs/). Bảng này liên kết task catalog với folder backlog qua cột **Backlog**.

## Tệp trong thư mục

| Tệp | Mục đích |
|-----|----------|
| [catalog.template.md](./catalog.template.md) | Copy thành `catalog.md` — bảng master |

## Các cột

| Cột | Bắt buộc | Mô tả |
|-----|----------|-------|
| **Function** | Có | Nhóm năng lực (dòng đầu mỗi nhóm) |
| **Task** | Có | Tên task ngắn — text thuần, không phải URL |
| **Backlog** | Có | Link tới `../../.backlogs/{id}/ready/{id}.md` hoặc `TBD` |
| **Summary** | Có | Tóm tắt task này bàn giao gì |
| **Outcome** | Có* | Giá trị nghiệp vụ (*ở dòng Function; tuỳ chọn ở dòng con) |

### Cột tuỳ chọn (dự án lớn)

| Cột | Khi thêm |
|-----|----------|
| **ID** | `FN-01` / `T-01` để trace với tracker ngoài (Redmine, Jira…) |
| **Module** | Nhiều vùng sản phẩm trong một catalog |
| **Priority** | P1/P2 cho thứ tự triển khai catalog chuẩn |
| **Status** | `planned` / `delivered` cho độ trưởng thành catalog |

## Khi nào cập nhật

- Thêm module hoặc năng lực mới vào sản phẩm
- Cách bóc tách task chuẩn của một Function thay đổi
- Task catalog mới → tạo `.backlogs/{id}/ready/` tương ứng và gắn link **Backlog**

## Khi nào không cập nhật

- Thay đổi một lần, bugfix, hoặc yêu cầu riêng khách hàng → chỉ tạo [.backlogs](../../.backlogs/)

## Checklist đối chiếu

- [ ] Yêu cầu map được với **Function** hiện có
- [ ] Yêu cầu map được với dòng **Task** hiện có (kiểm tra link **Backlog**)
- [ ] Task catalog mới? → thêm dòng + tạo `.backlogs/{id}/ready/` + link cột **Backlog**
- [ ] Cần Function mới? → cập nhật catalog + tạo backlog task

## Quy tắc cho agent

Khi tạo dòng task catalog:

1. Gán `{id}` (vd. `DEV_001` — id trống tiếp theo).
2. Tạo `.backlogs/{id}/draft/{id}.md` từ [_task.template.md](../../.backlogs/_task.template.md) (Define); Plan → `{id}/ready/{id}.md`.
3. Cột **Backlog** trỏ tới `[{id}](../../.backlogs/{id}/ready/{id}.md)`.
4. Cột **Task** chỉ là tiêu đề đọc được — không gắn link.
