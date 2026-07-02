# Database Design — ERD (Entity Relationship Diagram)

Hướng dẫn viết **`erd.md`** hoặc **`{module}-erd.md`** — sơ đồ quan hệ entity/bảng ở mức DD (đủ để tạo migration / review DBA).

**project-base** chỉ có README + template. Dự án tạo file khi đã chốt phạm vi dữ liệu (sau BD, trước implement schema).

---

## Mục đích

- Thể hiện **entity / bảng** và quan hệ 1-1, 1-N, N-N
- Làm nền cho [table definition](../database-table-definition/README.md) và [data dictionary](../database-data-dictionary/README.md)
- Trace tới AC / function trong `.backlogs/`

Không thay thế migration SQL — DD mô tả **thiết kế**; code migration là Develop.

---

## File cần tạo

| File | Nội dung |
|------|----------|
| `erd.md` hoặc `{module}-erd.md` | Sơ đồ + bảng tóm tắt entity — từ [_erd.template.md](./_erd.template.md) |

---

## Cấu trúc đề xuất

### 1. Metadata

Dự án · phạm vi (module) · version · ngày · task backlog link

### 2. Sơ đồ ERD (Mermaid `erDiagram`)

- Đặt tên entity = tên bảng logic (snake_case hoặc PascalCase — chốt một)
- Ghi cardinality: `||--o{`, `}|--|{`, …

### 3. Bảng tóm tắt entity

| Entity | Mô tả nghiệp vụ | Ghi chú |
|--------|-----------------|---------|
| `users` | Tài khoản đăng nhập | |

### 4. Bảng quan hệ

| From | To | Loại | FK / bảng trung gian | Ghi chú |
|------|-----|------|----------------------|---------|
| `users` | `orders` | 1-N | `orders.user_id` | |

---

## Phân biệt nhanh

| Tài liệu | Nội dung |
|----------|----------|
| **ERD** (DD) | Quan hệ tổng thể |
| **Table definition** | Cột, type, constraint từng bảng |
| **Data dictionary** | Ý nghĩa nghiệp vụ field |

---

## Checklist

- [ ] Mọi bảng trong scope có trong ERD
- [ ] Quan hệ khớp table definition
- [ ] Link file trong task **Design**

Skill: [design-workflow](../../../../.cursor/skills/design-workflow/SKILL.md)
