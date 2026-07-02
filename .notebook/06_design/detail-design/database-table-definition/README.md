# Database Design — Table Definition

Hướng dẫn viết **`{table_name}.md`** — định nghĩa **một bảng**: cột, kiểu, PK/FK, index, constraint, default.

**project-base** chỉ có README + template. Một file = một bảng (hoặc tách theo module nếu nhóm nhỏ).

---

## Mục đích

- Spec đủ để viết migration và review DBA
- Khớp [ERD](../database-erd/README.md); bổ sung [data dictionary](../database-data-dictionary/README.md) về nghĩa nghiệp vụ

---

## File cần tạo

| File | Nội dung |
|------|----------|
| `{table_name}.md` | Bảng cột + index + constraint — từ [_table-definition.template.md](./_table-definition.template.md) |

---

## Bảng chuẩn — Cột (columns)

| # | Column | Type | Null | Default | PK | FK | UK | Index | Ghi chú |
|---|--------|------|------|---------|----|----|----|----|---------|
| 1 | `id` | BIGINT UNSIGNED | No | AUTO | Yes | — | — | PK | |
| 2 | `user_id` | BIGINT UNSIGNED | No | — | — | `users.id` | — | idx | ON DELETE … |

**Quy ước:** tên cột `snake_case`; type theo DB dự án (PostgreSQL, MySQL, …).

### Bảng phụ — Index

| Tên index | Cột | Unique | Ghi chú |
|-----------|-----|--------|---------|

### Bảng phụ — Constraint / check

| Tên | Loại | Mô tả |
|-----|------|--------|

---

## Checklist

- [ ] Khớp ERD
- [ ] FK có ON DELETE / ON UPDATE
- [ ] Ý nghĩa field có trong data dictionary (nếu cần giải thích BA)

Skill: [design-workflow](../../../../.cursor/skills/design-workflow/SKILL.md)
