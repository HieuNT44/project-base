# External Interface Overview (Tổng quan giao tiếp hệ thống bên ngoài)

Hướng dẫn viết tài liệu **`external-interface-overview.md`** — quy định cách hệ thống **kết nối và trao đổi dữ liệu** với mọi hệ thống / dịch vụ **nằm ngoài phạm vi quản lý** của dự án.

**project-base** chỉ có README + template. Dự án tạo `external-interface-overview.md` khi có tích hợp bên thứ ba (thường song song [system-overview](../system-overview/_system-overview.template.md) § Integration và [architecture-be](../architecture-be/_backend-architecture.template.md) § API & Integration).

---

## Mục đích

Trả lời cho PM, BA, BE, Infra, Security cùng một bộ câu hỏi:

- Hệ thống **kết nối với những bên nào**, qua **giao thức gì**, **để làm gì**?
- Mỗi interface có mã **`INT-xxx`**; hướng **Inbound / Outbound** ra sao?
- **Real-time** hay **batch**? Liên quan [batch-overview](../batch-overview/README.md) không?
- **Bảo mật** chung: OAuth, API Key, IP whitelist, JWT, …
- Bên thứ ba **bảo trì / sự cố** → chức năng nào của mình bị ảnh hưởng?

Không thay thế **Interface Specification (DD)** — field mapping, request/response schema, error code từng endpoint: link task **Design**.

---

## Vai trò trong thiết kế

| Vai trò | Mô tả ngắn |
|---------|------------|
| **Vạch ranh giới (Boundary)** | Hệ thống mình làm được gì; khi nào phải nhờ hệ thống khác |
| **Thống nhất kết nối** | Một chuẩn bảo mật / giao thức — tránh mỗi dev tự nối một kiểu |
| **Quản lý rủi ro bên thứ ba** | Biết dependency; lên kế hoạch fallback, retry, thông báo vận hành |

---

## Khi nào viết

- Có REST/SOAP/webhook/gRPC/SFTP/DB link tới hệ thống ngoài
- Có payment, CRM (Salesforce), SMS, email, map, identity provider, …
- Trước implement client tích hợp đầu tiên hoặc trước review bảo mật
- Cập nhật khi thêm / đổi / gỡ interface

Dự án **standalone, không tích hợp ngoài** → ghi "N/A" hoặc bỏ artifact.

---

## File cần tạo

| File | Nội dung |
|------|----------|
| `external-interface-overview.md` | Sơ đồ + bảng interface — từ [_external-interface-overview.template.md](./_external-interface-overview.template.md) |

Header gợi ý: **Dự án** · **Version** · **Ngày cập nhật**

---

## Cấu trúc đề xuất (`external-interface-overview.md`)

### A. Sơ đồ liên kết (System Context / Interface Diagram)

Mermaid `flowchart`: khối trung tâm = hệ thống dự án; khối ngoài = Salesforce, Payment, SMS, …; mũi tên = hướng dữ liệu (Inbound / Outbound).

### B. Bảng danh mục Interface (master list)

Mỗi dòng = **một điểm kết nối** có thể quản lý và trace.

| Cột | Nội dung |
|-----|----------|
| **Interface ID** | `INT-001`, `INT-002`, … |
| **Hệ thống liên kết** | Tên dịch vụ / vendor (Payment gateway, Salesforce, SMS, …) |
| **Mục đích** | Lý do nghiệp vụ ngắn (thanh toán, đồng bộ CRM, gửi OTP, …) |
| **Direction** | **Outbound** — mình gọi ra · **Inbound** — bên ngoài gọi vào (webhook) · **Hai chiều** |
| **Protocol / Format** | REST (JSON), SOAP (XML), Webhook, gRPC, SFTP, DB link, … |
| **Tần suất / Kích hoạt** | Real-time (theo thao tác user) · Batch (cron — link `BT-xxx` trong batch-overview) |
| **Bảo mật** | API Key, OAuth 2.0, mTLS, IP whitelist, JWT, HMAC signature, … |
| **Chức năng bị ảnh hưởng** | Feature / màn hình phụ thuộc — phục vụ đánh giá rủi ro |
| **Owner** | Team / service chịu trách nhiệm |
| **DD** | Link Interface Specification (task **Design**) |

Template có **2 dòng placeholder** — thay bằng interface thật.

### C. Quy ước chung *(khuyến nghị)*

| Mục | Ghi chú |
|-----|---------|
| Timeout / retry | Thống nhất cho outbound HTTP |
| Idempotency | Webhook inbound, payment callback |
| Secret management | Env / vault — không commit key |
| Lỗi API | [api-error-handling](../api-error-handling/README.md) cho API **của mình**; mapping lỗi vendor ghi ở DD |

### D. Implementation *(khi đã có code)*

Đường dẫn `integrations/` client, config env, OpenAPI export nếu có.

---

## Quy trình BD vs DD

| Giai đoạn | Trả lời câu hỏi |
|-----------|-----------------|
| **Basic Design** (tài liệu này) | Kết nối **bên nào**, **giao thức gì**, **mục đích gì**, **hướng & bảo mật** ra sao? |
| **Detail Design** | Từng field, kiểu dữ liệu, endpoint path, sequence, test case — **Interface Specification** |

---

## Ví dụ ngữ cảnh *(tham khảo, không copy vào base)*

| ID | Hệ thống | Direction | Protocol | Kích hoạt | Bảo mật |
|----|----------|-----------|----------|-----------|---------|
| INT-001 | Salesforce | Outbound (+ batch) | REST JSON | Real-time + batch đêm | OAuth 2.0 |
| INT-002 | Payment (Momo) | Outbound + Inbound webhook | REST + Webhook | Real-time | API Key + HMAC |

---

## Liên kết triển khai

| External interface | Code / design |
|--------------------|---------------|
| §3.4 Integration (system-overview) | Tóm tắt — chi tiết tại đây |
| `integrations/` module | [architecture-be](../architecture-be/_backend-architecture.template.md) |
| Job đồng bộ định kỳ | [batch-overview](../batch-overview/README.md) |
| Lỗi API nội bộ | [api-error-handling](../api-error-handling/README.md) |
| Spec từng API | DD — link task **Design** |

---

## Phân biệt nhanh

| Tài liệu | Nội dung |
|----------|----------|
| **external-interface-overview** | Danh mục interface + sơ đồ + bảo mật tổng quan |
| **system-overview** § 3.4 | Bảng tóm tắt vài dòng — trỏ sang overview đầy đủ |
| **architecture-be** | Cấu trúc code `integrations/`, pattern gọi API |
| **batch-overview** | Job chạy ngần — có thể là kênh sync với bên ngoài |
| **Interface Specification (DD)** | Request/response, field, error mapping chi tiết |

---

## Nguyên tắc (base-project)

| Nên | Không nên |
|-----|-----------|
| Một dòng = một interface quản lý được | Gộp nhiều API khác vendor vào một dòng mơ hồ |
| Ghi rõ Inbound vs Outbound | Chỉ ghi "tích hợp Salesforce" không hướng |
| Ghi chức năng bị ảnh hưởng khi vendor down | Bỏ qua dependency risk |
| Link DD khi interface phức tạp | Nhồi toàn bộ OpenAPI vào BD |
| Cập nhật khi thêm endpoint production | Doc lệch code thực tế |

---

## Checklist

- [ ] Sơ đồ context khớp bảng master list
- [ ] Mọi integration production có `INT-xxx`
- [ ] Bảo mật đã review (Security / Tech Lead)
- [ ] Batch sync có cross-ref `BT-xxx` nếu có
- [ ] Interface phức tạp đã link DD trong task **Design**
- [ ] Link `external-interface-overview.md` trong task `.backlogs/` mục **Design** (scope có tích hợp)

Skill: [design-workflow](../../../../.cursor/skills/design-workflow/SKILL.md)
