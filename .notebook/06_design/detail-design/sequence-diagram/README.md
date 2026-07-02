# Sequence Diagram (Sơ đồ trình tự)

Hướng dẫn viết **`{flow-id}-sequence.md`** — tương tác **theo thời gian** giữa actor, FE, BE, DB, hệ thống ngoài.

**project-base** chỉ có README + template. Dùng khi luồng có nhiều bước async, tích hợp, hoặc transaction.

---

## Mục đích

- Làm rõ **thứ tự** gọi API, ghi DB, gọi bên thứ ba
- Bổ sung [logic-design](../logic-design/README.md) và [api-document](../api-document/README.md)
- Trace AC / Screen ID / `INT-xxx` / `BT-xxx`

---

## File cần tạo

| File | Nội dung |
|------|----------|
| `{flow-id}-sequence.md` | Mermaid `sequenceDiagram` + bảng bước — từ [_sequence-diagram.template.md](./_sequence-diagram.template.md) |

`flow-id` gợi ý: `F-LOGIN`, `F-ORDER-PAY`, khớp logic-design nếu có.

---

## Cấu trúc đề xuất

### 1. Metadata

Flow ID · tên luồng · trigger · AC link

### 2. Sơ đồ Mermaid

Participant: User, FE, BE, DB, External (Salesforce, Payment, …)

### 3. Bảng bước (Step table)

| Step | From | To | Hành động | API / event | Ghi chú |
|------|------|-----|-----------|-------------|---------|

### 4. Nhánh lỗi *(khi có)*

| Điều kiện | Hành vi | error.code |
|-----------|---------|------------|

---

## Phân biệt nhanh

| Tài liệu | Nội dung |
|----------|----------|
| **screen-flow** (BD) | Chuyển **màn** UI |
| **sequence-diagram** (DD) | Gọi **service/API** theo thời gian |
| **logic-design** | Điều kiện, nhánh nghiệp vụ (có thể không vẽ time) |

---

## Checklist

- [ ] Participant khớp architecture-be
- [ ] API có link api-document
- [ ] Nhánh lỗi chính đã ghi

Skill: [design-workflow](../../../../.cursor/skills/design-workflow/SKILL.md)
