# Table Definition — `{table_name}`

**Cập nhật:** YYYY-MM-DD  
**Engine / DB:** {PostgreSQL 16 | MySQL 8 | …}

> Copy thành `{table_name}.md`. ERD: [../database-erd/](../database-erd/README.md).

---

## 1. Mô tả bảng

| Mục | Giá trị |
|-----|---------|
| Tên bảng | `{table_name}` |
| Mục đích | {…} |
| Entity ERD | `{entity}` |

---

## 2. Columns

| # | Column | Type | Null | Default | PK | FK | UK | Index | Ghi chú |
|---|--------|------|------|---------|----|----|----|-------|---------|
| 1 | `id` | BIGINT UNSIGNED | No | AUTO_INCREMENT | Yes | — | — | PK | |
| 2 | `{column}` | VARCHAR(255) | No | — | — | — | — | | |

---

## 3. Indexes

| Tên | Cột | Unique | Ghi chú |
|-----|-----|--------|---------|
| `idx_{table}_{col}` | `{column}` | No | |

---

## 4. Constraints

| Tên | Loại | Mô tả |
|-----|------|--------|
| `fk_{table}_user_id` | FOREIGN KEY | `user_id` → `users.id` ON DELETE CASCADE |

---

## 5. Ghi chú migration / seed *(tuỳ chọn)*

| Mục | Ghi chú |
|-----|---------|
| Partition | |
| Soft delete | `deleted_at` nếu có |
