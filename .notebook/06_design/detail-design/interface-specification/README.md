# Interface Specification (Spec tích hợp bên ngoài)

Hướng dẫn viết **`{INT-xxx}-spec.md`** — contract **chi tiết** với hệ thống bên thứ ba: endpoint, auth, request/response field, mapping, lỗi vendor.

**project-base** chỉ có README + template. Mỗi file gắn **`INT-xxx`** từ [external-interface-overview](../../basic-design/external-interface-overview/README.md).

---

## Mục đích

- BD overview trả lời *kết nối bên nào* — DD trả lời *gọi thế nào, field gì*
- Đủ để implement `integrations/` client và test stub
- Phân biệt lỗi **vendor** vs lỗi **API nội bộ** (api-error-handling)

---

## File cần tạo

| File | Nội dung |
|------|----------|
| `{INT-xxx}-spec.md` | Spec interface — từ [_interface-specification.template.md](./_interface-specification.template.md) |

Ví dụ: `INT-001-spec.md` (Salesforce), `INT-002-spec.md` (Payment).

---

## Cấu trúc đề xuất

### Metadata

INT ID · hệ thống · direction · protocol · owner · batch `BT-xxx` (nếu sync batch)

### Connection

Base URL · auth · rate limit · timeout · retry

### Operations (bảng)

| Op ID | Tên | Method / action | Direction | Mô tả |
|-------|-----|-----------------|-----------|--------|

### Request / Response field (từng operation)

| Field | Direction | Type | Required | Mapping nội bộ | Ghi chú |

### Error mapping

| Vendor code / HTTP | Ý nghĩa | Xử lý hệ thống mình |
|--------------------|---------|---------------------|

### Sequence *(tuỳ chọn)*

Link sequence-diagram

---

## Phân biệt nhanh

| Tài liệu | Nội dung |
|----------|----------|
| **external-interface-overview** (BD) | Danh mục INT, protocol, bảo mật tổng quan |
| **interface-specification** (DD) | Field-level, operation, mapping |
| **api-document** (DD) | API **của dự án** (public cho FE/mobile) |

---

## Checklist

- [ ] INT ID khớp external-interface-overview
- [ ] Auth & secret không ghi plaintext trong repo public
- [ ] Mapping field ↔ DB / DTO
- [ ] Link task **Design**

Skill: [design-workflow](../../../../.cursor/skills/design-workflow/SKILL.md)
