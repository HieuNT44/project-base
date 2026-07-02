# Batch Overview (Tổng quan tác vụ chạy ngầm)

Hướng dẫn viết tài liệu **`batch-overview.md`** — bản mô tả tổng quan các **chương trình / tiến trình xử lý tự động**, chạy ngầm theo **lịch (scheduled)** hoặc **sự kiện (event-driven)**, không cần thao tác trực tiếp trên giao diện.

**project-base** chỉ có README + template. Dự án tạo `batch-overview.md` trong thư mục này khi có job nền (thường sau [architecture-be](../architecture-be/_backend-architecture.template.md), song song [system-overview](../system-overview/_system-overview.template.md) nếu có tích hợp CRM / đồng bộ dữ liệu).

---

## Mục đích

Trả lời cho PM, BA, BE, Infra, vận hành cùng một bộ câu hỏi:

- Hệ thống có **những batch / job nào**? Mã định danh (BT-xxx) là gì?
- Mỗi job **chạy khi nào** — cron, queue, hay kích hoạt bởi sự kiện nghiệp vụ?
- **Lấy dữ liệu từ đâu**, **đẩy kết quả đi đâu** (DB, Salesforce, email, …)?
- **Luồng xử lý tóm tắt** — các bước chính, không thay spec chi tiết từng job?
- **Khi lỗi** — retry, alert, log, dead-letter — theo chuẩn nào?

Không thay thế **Detail Design từng batch** (sequence, field mapping, idempotency…) — link task **Design** hoặc doc DD riêng.

---

## Vai trò trong thiết kế

| Vai trò | Mô tả ngắn |
|---------|------------|
| **Đồng bộ dữ liệu** | Đồng bộ khối lượng lớn giữa hệ thống nội bộ và bên thứ ba (ví dụ Salesforce) theo khung giờ cố định |
| **Tác vụ định kỳ** | Quét DB gửi email sinh nhật, gia hạn gói, tổng hợp báo cáo cuối tháng, … |
| **Giải phóng hiệu năng** | Gom tác vụ nặng vào khung giờ thấp điểm để không ảnh hưởng web/mobile ban ngày |

---

## Khi nào viết

- Dự án có **cron**, **queue worker**, **scheduled task**, hoặc **event consumer**
- Có tích hợp đồng bộ (CRM, payment webhook xử lý async, export hàng loạt)
- Trước implement job đầu tiên hoặc trước chốt lịch chạy production
- Cập nhật khi thêm / đổi / gỡ batch

Dự án **không có** job nền → ghi rõ "N/A" trong `batch-overview.md` hoặc bỏ artifact; không bắt buộc trong base.

---

## File cần tạo

| File | Nội dung |
|------|----------|
| `batch-overview.md` | Master list + quy ước chung — từ [_batch-overview.template.md](./_batch-overview.template.md) |

Header gợi ý: **Dự án** · **Version** · **Ngày cập nhật**

---

## Cấu trúc đề xuất (`batch-overview.md`)

### 0. Quy ước chung

- **Mã batch:** `BT-001`, `BT-002`, … (hoặc prefix dự án)
- **Loại kích hoạt:** `Scheduled` (cron) · `Event-driven` · `Manual / On-demand` · `Queue`
- **Môi trường:** job chỉ chạy ở prod / staging / cả hai
- **Timezone** cho cron (ví dụ `Asia/Tokyo`)

### 1. Master list (bảng chính)

Mỗi dòng = **một batch / job** có thể vận hành và trace được.

| Cột | Nội dung |
|-----|----------|
| **Batch ID** | Mã định danh (ví dụ `BT-001`) |
| **Tên batch** | Tên gợi nhớ / tên job trong code (ví dụ `Sync_User_To_Salesforce`) |
| **Loại** | Scheduled / Event-driven / … |
| **Trigger / Schedule** | Cron (`0 2 * * *`), event (`order.paid`), hoặc mô tả ngắn |
| **Input** | Nguồn dữ liệu (bảng, API, file, message queue) |
| **Output** | Đích (Salesforce API, bảng khác, email, S3, …) |
| **Process overview** | 3–5 bước: Lấy → Validate → Transform → Gửi → Ghi log |
| **Error handling** | Retry, alert (Slack/Email), DLQ, skip record — tóm tắt |
| **Owner** | Team / service chịu trách nhiệm |
| **DD** | Link spec chi tiết (task **Design** hoặc file DD) |

Template có **2 dòng placeholder** — thay bằng batch thật của dự án.

### 2. Sơ đồ tổng quan *(tuỳ chọn)*

Mermaid `flowchart` hoặc bảng nhóm theo domain: Sync, Notification, Reporting, Maintenance.

### 3. Chính sách lỗi & vận hành *(khuyến nghị)*

Bảng ngắn thống nhất toàn hệ thống — chi tiết từng batch vẫn ghi ở cột **Error handling**:

| Mục | Quy ước |
|-----|---------|
| Retry | Số lần, backoff, idempotent hay không |
| Alert | Kênh (Slack, PagerDuty, email ops) |
| Log | Correlation id, structured log |
| DLQ / failed jobs | Lưu ở đâu, ai xử lý |
| API lỗi ngoài | Tham chiếu [api-error-handling](../api-error-handling/README.md) nếu job gọi REST |

### 4. Implementation *(khi đã có code)*

Đường dẫn thật: scheduler (Laravel Schedule, Bull, Step Functions…), queue name, env flag tắt job ở dev.

---

## Ví dụ ngữ cảnh (tham khảo, không copy vào base)

| Batch ID | Tên | Trigger | Input → Output |
|----------|-----|---------|----------------|
| BT-001 | Sync_User_To_Salesforce | `0 0 * * *` (00:00 hàng ngày) | `users` → Salesforce Contact API |
| BT-002 | Send_Birthday_Email | `0 8 * * *` | `customers` (sinh nhật hôm nay) → Email service |

---

## Liên kết triển khai

| Batch overview | Code / design |
|----------------|---------------|
| §3.4 Async / Batch | [architecture-be](../architecture-be/_backend-architecture.template.md) |
| Lỗi API khi job gọi REST | [api-error-handling](../api-error-handling/README.md) |
| Luồng đồng bộ CRM | [external-interface-overview](../external-interface-overview/README.md) · [system-overview](../system-overview/_system-overview.template.md) |
| Spec từng job | DD — link task **Design** |

---

## Phân biệt nhanh

| Tài liệu | Nội dung |
|----------|----------|
| **batch-overview** | Danh sách master + quy ước vận hành chung |
| **architecture-be** § Async | Khung kỹ thuật (queue, folder `jobs/`) |
| **DD batch** | Mapping field, sequence, idempotency, test case từng job |
| **api-error-handling** | Envelope lỗi HTTP — job gọi API tuân theo |
| **external-interface-overview** | Interface realtime / webhook — batch sync tham chiếu `BT-xxx` |

---

## Nguyên tắc (base-project)

| Nên | Không nên |
|-----|-----------|
| Một dòng = một job vận hành được | Gộp nhiều cron khác nhau vào một dòng mơ hồ |
| Ghi timezone và môi trường chạy | Cron không rõ TZ |
| Error handling có thể hành động được | Chỉ ghi "báo lỗi" không nói kênh / retry |
| Link DD khi job phức tạp | Nhồi toàn bộ sequence vào overview |
| Cập nhật khi thêm job production | Doc lệch scheduler thực tế |

---

## Checklist

- [ ] Mọi job production có trong master list
- [ ] Trigger/schedule + timezone đã chốt với Infra / ops
- [ ] Input/Output đủ để BE và QA hiểu phạm vi dữ liệu
- [ ] Error handling thống nhất §3 (hoặc ghi ngoại lệ rõ từng dòng)
- [ ] Không mâu thuẫn [architecture-be](../architecture-be/_backend-architecture.template.md) § Async
- [ ] Job phức tạp đã link DD trong task **Design**
- [ ] Link `batch-overview.md` trong task `.backlogs/` mục **Design** (scope có batch)

Skill: [design-workflow](../../../../.cursor/skills/design-workflow/SKILL.md)
