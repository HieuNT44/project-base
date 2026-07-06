# Danh sách chức năng — {Tên sản phẩm hoặc module}

Copy thành `catalog.md` khi định nghĩa catalog chức năng cho dự án.

| Function | Task | Backlog | Summary | Outcome |
|----------|------|---------|---------|---------|
| **{Tên function}** | {Tiêu đề task — nhãn ngắn} | [{id}](../../.backlogs/{id}/ready/{id}.md) | Task chuẩn này bao phủ gì | Giá trị cho user hoặc nghiệp vụ |
| | {Tiêu đề task khác} | [{id}](../../.backlogs/{id}/ready/{id}.md) | | |
| | {Task chưa tạo} | TBD | Task dự kiến | | |

## Hướng dẫn từng cột

| Cột | Mục đích |
|-----|----------|
| **Function** | Nhóm năng lực. Chỉ ghi ở dòng đầu mỗi nhóm. |
| **Task** | Tên ngắn, dễ đọc — không phải link. |
| **Backlog** | Link tới `../../.backlogs/{id}/ready/{id}.md` hoặc `TBD` nếu chưa tạo. |
| **Summary** | Mô tả mức Plan (làm gì). Không ghi tên API hay design chi tiết. |
| **Outcome** | Giá trị nghiệp vụ. Thường ghi ở dòng đầu mỗi nhóm Function. |

## Ghi chú

- Một dòng catalog = một task chuẩn = một folder `.backlogs/{id}/`.
- Yêu cầu một lần → chỉ tạo [.backlogs](../../.backlogs/); không thêm dòng catalog trừ khi sản phẩm có năng lực mới.
- Tiêu chí nghiệm thu và verification chi tiết nằm trong file backlog task, không nằm trong bảng này.
