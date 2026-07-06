# Matrix Design (Ma trận quyền & chức năng) — {Tên dự án}

- **Dự án:** {Tên dự án}
- **Version:** v{X.Y}
- **Cập nhật:** YYYY-MM-DD
- **Phạm vi:** {Module / kênh áp dụng ma trận}

> Copy thành `matrix-design.md` (cùng thư mục, bỏ prefix `_`). Ví dụ điền mẫu: [_matrix-design.example.md](./_matrix-design.example.md). Tham chiếu [02_function-list](../../../02_function-list/catalog.md) · [screen-list](../screen-list/screen-list.md).

---

## 0. Mục lục & quy ước

### 0.1 Danh sách Module / Feature

| STT | Module |
|-----|--------|
| 1 | {Auth} |
| 2 | {Module name} |
| 3 | {…} |

### 0.2 Danh sách Role

| STT | Role | Mô tả ngắn |
|-----|------|------------|
| 1 | {Role A} | {Ai là role này} |
| 2 | {Role B} | |
| 3 | {…} | |

### 0.3 Chú thích ký hiệu

| Ký hiệu | Ý nghĩa |
|---------|---------|
| ✅ | Có quyền (full access) |
| 👁️ | Chỉ xem (read-only) |
| ❌ | Không có quyền |
| 🧪 | Chỉ môi trường test / staging |
| △ | Có điều kiện — xem ghi chú dưới bảng |

**Ghi chú role** *(tuỳ chọn — giải thích △, owner scope, …):*

> {Ví dụ: User chỉ thao tác dữ liệu của chính mình. Staff △ = khi được Admin gán quyền module X.}

---

## 1. {Tên module}

| Function | {Role A} | {Role B} | {Role C} | … |
|----------|----------|----------|----------|---|
| {Hành động / capability cụ thể} | ✅ | ❌ | △ | |
| {…} | | | | |

_Ghi chú △ (nếu có): {điều kiện}_

---

## 2. {Tên module}

| Function | {Role A} | {Role B} | … |
|----------|----------|----------|---|
| {…} | | | |

### {Tên module lớn — chia nhóm tuỳ chọn}

#### Create

| Function | {Role A} | {Role B} | … |
|----------|----------|----------|---|
| {…} | | | |

#### Edit

| Function | {Role A} | {Role B} | … |
|----------|----------|----------|---|
| {…} | | | |

#### View

| Function | {Role A} | {Role B} | … |
|----------|----------|----------|---|
| {…} | | | |

---

## N. {Module chung / Other}

| Function | {Role A} | {Role B} | … |
|----------|----------|----------|---|
| {…} | | | |

---

## Trạng thái triển khai (Implementation Status)

| Hạng mục | Trạng thái | Ghi chú |
|----------|------------|---------|
| {Module / guard FE} | Done / Partial / Planned / Pending | |
| {Policy / middleware BE} | | |

---

## Đường dẫn triển khai (Implementation Paths)

| Lớp | Path |
|-----|------|
| FE route guard | `{frontend/src/…}` |
| FE ẩn menu / nút | `{path}` |
| BE policy / middleware | `{backend/…}` |

---

## Tài liệu liên quan

| Loại | Đường dẫn |
|------|-----------|
| Architecture FE | [frontend-architecture.md](../architecture-fe/frontend-architecture.md) § Routing & Permission |
| Architecture BE | [backend-architecture.md](../architecture-be/backend-architecture.md) |
| Screen list | [screen-list.md](../screen-list/screen-list.md) |
| Function list | [catalog.md](../../../02_function-list/catalog.md) |

## Phê duyệt

| | |
|---|---|
| **Người review** | |
| **Ngày** | |
| **Trạng thái** | draft / approved |
