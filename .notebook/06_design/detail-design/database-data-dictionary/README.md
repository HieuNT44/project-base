# Database Design — Data Dictionary

Hướng dẫn viết **`data-dictionary.md`** (hoặc `{module}-data-dictionary.md`) — **ý nghĩa nghiệp vụ** từng field, giá trị enum, quy tắc dữ liệu (cho BA, QA, BE).

**project-base** chỉ có README + template. Bổ sung [table definition](../database-table-definition/README.md) — không lặp type SQL nếu đã có ở table def.

---

## Mục đích

- Giải thích **field là gì**, ai nhập, nguồn dữ liệu, giá trị hợp lệ
- Enum / status code có mô tả từng giá trị
- Trace PII, retention, masking nếu có NFR

---

## File cần tạo

| File | Nội dung |
|------|----------|
| `data-dictionary.md` | Master dictionary — từ [_data-dictionary.template.md](./_data-dictionary.template.md) |

---

## Bảng chuẩn — Data dictionary

| Table | Column | Label (nghiệp vụ) | Mô tả | Kiểu logic | Enum / giá trị | Nguồn | PII | Ghi chú |
|-------|--------|-------------------|-------|------------|----------------|-------|-----|---------|
| `users` | `email` | Email đăng nhập | Unique, dùng login | string | — | User nhập | Yes | |
| `orders` | `status` | Trạng thái đơn | | enum | `pending`, `paid`, `cancelled` | Hệ thống | No | Xem § status |

### Bảng phụ — Enum / status (khi cần)

| Table.Column | Value | Label | Mô tả | Chuyển tiếp được |
|--------------|-------|-------|-------|------------------|

---

## Phân biệt nhanh

| Tài liệu | Nội dung |
|----------|----------|
| **Table definition** | Type SQL, FK, index |
| **Data dictionary** | Nghĩa nghiệp vụ, enum, PII |

---

## Checklist

- [ ] Mọi cột “khó hiểu” có mô tả
- [ ] Enum có đủ giá trị production
- [ ] Khớp table definition & ERD

Skill: [design-workflow](../../../../.cursor/skills/design-workflow/SKILL.md)
