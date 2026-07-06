# Yêu cầu nghiệp vụ (BRD)

Bối cảnh **nghiệp vụ** ổn định: dự án tồn tại vì sao, phục vụ ai, trong phạm vi nào.  
Không liệt kê chức năng (xem [danh sách chức năng](../02_function-list/)), yêu cầu phi chức năng (xem [NFR](../03_non-functional-requirements/)), hay task (xem [backlog](../../.backlogs/)).

## Tệp trong thư mục

| Tệp | Mục đích |
|-----|----------|
| [overview.template.md](./overview.template.md) | Copy thành `overview.md` khi khởi động dự án |
| `glossary.md` | *(tuỳ chọn)* Thuật ngữ nghiệp vụ — tách từ overview khi dài |
| `lifecycle.md` | *(tuỳ chọn)* Quy trình nghiệp vụ — tách khi dài |
| `access-matrix.md` | *(tuỳ chọn)* Ai dùng màn hình / kênh nào |
| `phased-delivery.md` | *(tuỳ chọn)* Các giai đoạn triển khai theo góc nhìn nghiệp vụ |

Dự án nhỏ: một file `overview.md` là đủ.  
Dự án lớn: giữ mục 1–6 trong `overview.md`; chuyển mục 7–11 sang file riêng.

## Các mục trong overview.template.md

| # | Mục | Bắt buộc |
|---|-----|----------|
| 1 | Tổng quan | Có |
| 2 | Các bên liên quan (stakeholder) | Có |
| 3 | Mục tiêu nghiệp vụ & chỉ số thành công | Có |
| 4 | Phạm vi IN / OUT | Có |
| 5 | Giả định | Có |
| 6 | Ràng buộc | Có |
| 7 | Thuật ngữ | Tuỳ chọn |
| 8 | Quy trình / vòng đời nghiệp vụ | Tuỳ chọn |
| 9 | Ai dùng gì | Tuỳ chọn |
| 10 | Triển khai theo giai đoạn (góc nhìn nghiệp vụ) | Tuỳ chọn |
| 11 | Nghiệm thu cấp nghiệp vụ | Tuỳ chọn |
| 12 | Phê duyệt | Có |

## Khi nào cập nhật

- Kickoff dự án
- Phạm vi IN/OUT thay đổi và được stakeholder duyệt
- Nhóm stakeholder mới ảnh hưởng bàn giao
- Quy trình nghiệp vụ hoặc thuật ngữ thay đổi

## Checklist đối chiếu

Khi xử lý yêu cầu mới ([.workflow-sldc/01_WORKFLOW.md](../../.workflow-sldc/01_WORKFLOW.md)):

- [ ] Yêu cầu nằm trong **phạm vi IN**
- [ ] Yêu cầu không nằm trong **phạm vi OUT**
- [ ] Chỉ số thành công vẫn khớp **mục tiêu nghiệp vụ**
- [ ] Tác nhân khớp **stakeholder** và **ai dùng gì** (nếu đã ghi)
- [ ] Yêu cầu không mâu thuẫn **giả định** nếu chưa được duyệt rõ
