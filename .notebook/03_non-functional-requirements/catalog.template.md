# Yêu cầu phi chức năng — {Tên dự án}

Copy thành `catalog.md` khi định nghĩa NFR cho dự án.

| ID | Category | Requirement | Verification |
|----|----------|-------------|--------------|
| NFR-01 | Security | Ví dụ: user chỉ truy cập bản ghi của mình | Test role thủ công / test auth tự động |
| NFR-02 | Performance | Ví dụ: API p95 < 500ms | Load test / APM |
| NFR-03 | i18n | Ví dụ: UI hỗ trợ EN và JA | Kiểm tra locale thủ công |
| NFR-04 | Availability | Ví dụ: uptime 99.9% / tháng | Monitoring / báo cáo SLA |
| NFR-05 | Compliance | Ví dụ: audit log cho thay đổi nhạy cảm | Rà soát audit trail |

## Nhóm tham chiếu (Category)

- Security — Bảo mật
- Performance — Hiệu năng
- Scalability — Khả năng mở rộng
- Availability — Khả dụng
- i18n / accessibility — Đa ngôn ngữ / khả năng tiếp cận
- Compliance / privacy — Tuân thủ / quyền riêng tư
- Operability — Vận hánh (backup, deploy, monitor)

## Hướng dẫn từng cột

| Cột | Mục đích |
|-----|----------|
| **ID** | Mã NFR (`NFR-01`, …) để trace trong task và design |
| **Category** | Nhóm thuộc tính chất lượng |
| **Requirement** | Yêu cầu cụ thể, đo hoặc kiểm được |
| **Verification** | Cách chứng minh đạt yêu cầu (test, tool, review) |

## Ghi chú

- NFR liên quan task cụ thể → ghi ở mục §7 Non-functional trong file backlog `ready/`, tham chiếu ID ở đây.
- Không nhân đôi nội dung chi tiết — catalog giữ bản tổng; task giữ phạm vi áp dụng cho từng việc.
