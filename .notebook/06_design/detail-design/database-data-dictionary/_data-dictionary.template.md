# Data Dictionary — {Tên dự án / Module}

**Cập nhật:** YYYY-MM-DD

> Copy thành `data-dictionary.md`. Cột kỹ thuật: [table definition](../database-table-definition/README.md).

---

## 1. Dictionary

| Table | Column | Label (nghiệp vụ) | Mô tả | Kiểu logic | Enum / giá trị | Nguồn | PII | Ghi chú |
|-------|--------|-------------------|-------|------------|----------------|-------|-----|---------|
| `{table}` | `{column}` | {Label} | {…} | string | — | User / API / Batch | No | |
| `{table}` | `status` | Trạng thái | | enum | xem §2 | Hệ thống | No | |

---

## 2. Enum / status values

| Table.Column | Value | Label | Mô tả | Ghi chú |
|--------------|-------|-------|-------|---------|
| `{table}.status` | `pending` | Chờ xử lý | | |
| `{table}.status` | `paid` | Đã thanh toán | | |

---

## Tài liệu liên quan

| Loại | Path |
|------|------|
| ERD | `../database-erd/erd.md` |
| Table `{table}` | `../database-table-definition/{table}.md` |
