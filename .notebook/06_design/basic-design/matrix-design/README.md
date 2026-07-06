# Matrix Design (Ma trận quyền & chức năng)

Hướng dẫn viết tài liệu **`matrix-design.md`** — bảng **Function × Role**: ai được làm gì, mức quyền ra sao (full, read-only, không, có điều kiện).

**project-base** có README + template + example. Dự án tạo `matrix-design.md` trong thư mục này khi đã chốt role và phạm vi feature (thường sau [screen-list](../screen-list/_screen-list.template.md) hoặc `02_function-list`).

## Tài liệu trong thư mục

| File | Mục đích |
|------|----------|
| [_matrix-design.template.md](./_matrix-design.template.md) | Template chính — copy thành `matrix-design.md` |
| [_matrix-design.example.md](./_matrix-design.example.md) | Ví dụ điền mẫu (UGC Agent) |
| `matrix-design.md` | Bản chính thức (sau khi copy & điền) |

---

## Mục đích

Một chỗ tra cứu cho PM, BA, FE, BE, QA:

- **Role** nào tồn tại trong hệ thống?
- **Module / nhóm chức năng** nào cần phân quyền?
- Từng **function** (hành động cụ thể): Reader / Creator / Admin / Staff — ✅ 👁️ ❌ △ 🧪?
- Staff / role phụ: quyền **có điều kiện** (△) ghi rõ ở đâu (footnote hoặc cột ghi chú)

Dùng để: thiết kế guard API, ẩn/hiện menu UI, viết AC, test permission — **trước** implement chi tiết từng màn.

---

## Khi nào viết

- Đã có danh sách role (stakeholder / `01` / permission overview)
- Đã có khung feature hoặc function-list (`02`)
- Trước Detail Design màn admin / trước implement RBAC
- Cập nhật khi thêm role, module, hoặc đổi policy quyền

Tóm tắt RBAC tổng quan: dùng [matrix-design](../matrix-design/README.md) hoặc doc riêng của dự án. **matrix-design** đi sâu **từng function**.

---

## File cần tạo

| File | Nội dung |
|------|----------|
| [_matrix-design.template.md](./_matrix-design.template.md) | Template — copy thành `matrix-design.md` |
| [_matrix-design.example.md](./_matrix-design.example.md) | Ví dụ UGC Agent |
| `matrix-design.md` | Ma trận đầy đủ — **một file** hoặc tách `matrix-design-{module}.md` nếu quá lớn |

Header: **Dự án** · **Version** · **Ngày**

---

## Cấu trúc đề xuất (`matrix-design.md`)

### 0. Mục lục & quy ước

**0.1 Danh sách Module / Feature**

| STT | Module |
|-----|--------|
| 1 | {Auth} |
| 2 | {…} |

**0.2 Danh sách Role**

| STT | Role |
|-----|------|
| 1 | {Admin} |
| 2 | {…} |

**0.3 Chú thích ký hiệu** *(thống nhất toàn doc)*

| Ký hiệu | Ý nghĩa |
|---------|---------|
| ✅ | Có quyền (full access) |
| 👁️ | Chỉ xem (read-only) |
| ❌ | Không có quyền |
| 🧪 | Chỉ môi trường test |
| △ | Có điều kiện / giới hạn — **ghi chú** điều kiện ngay dưới bảng hoặc cột Note |

Có thể thêm ký hiệu dự án (ví dụ: chỉ owner, chỉ draft) — khai báo một lần ở §0.3.

---

### 1…N. Từng module (section theo mục lục)

Mỗi module = một heading `# {STT}. {Tên module}`.

**Bảng chuẩn:**

| Function | {Role A} | {Role B} | {Role C} | … |
|----------|----------|----------|----------|---|
| {Hành động / capability cụ thể} | ✅ | ❌ | △ | |
| … | | | | |

**Quy tắc viết dòng Function:**

- Một dòng = **một hành động** test được (không gộp “quản lý toàn bộ”)
- Tên function = ngôn ngữ nghiệp vụ (PM đọc được), không chỉ tên API
- Module lớn có thể chia **## Create / ## Edit / ## View** (như Post)

**Ví dụ cấu trúc section** *(tham khảo, không copy nguyên sang dự án khác)*:

```
# 1. Auth
# 2. Profile
# 3. Reading
# 4. Post
   ## Create
   ## Edit
   ## View
# 5. Verify
# 6. Payment & Earnings
…
# N. Chung
```

Số section và tên module **do dự án định nghĩa** — khớp `02_function-list` hoặc backlog.

---

## Cột Role

- Cột = **role runtime** (người dùng đăng nhập với role gì)
- Thứ tự cột cố định trong toàn file (ví dụ: Reader → Creator → Admin → Staff)
- Role không dùng → bỏ cột; role mới → thêm cột + cập nhật §0.2

**△ Staff / role có điều kiện:** thêm đoạn ngắn:

> Staff: △ = chỉ khi được Admin gán quyền module X (ghi rõ trong matrix-design).

---

## Liên kết triển khai

| Ma trận | Code / design |
|---------|----------------|
| ✅ / ❌ trên API | Policy / middleware / guard — [architecture-be](../architecture-be/_backend-architecture.template.md) |
| Ẩn menu / nút UI | Route guard — [architecture-fe](../architecture-fe/_frontend-architecture.template.md) § Routing & Permission |
| Màn admin | [screen-list](../screen-list/_screen-list.template.md) cột Permission |
| AC task | `.backlogs/` — trace function → AC |

---

## Phân biệt nhanh

| Tài liệu | Nội dung |
|----------|----------|
| `matrix-design` | Bảng Function × Role chi tiết |
| `architecture-fe` / `architecture-be` | Guard API, route |
| `02_function-list` | Catalog capability — link backlog |
| `screen-list` | Danh sách màn hình |

---

## Nguyên tắc (base-project)

| Nên | Không nên |
|-----|-----------|
| Ký hiệu thống nhất §0.3 | Mỗi bảng tự đặt ký hiệu khác |
| Function nhỏ, testable | Một dòng “full quyền module” |
| Cập nhật khi đổi policy | Ma trận lệch code production |
| Ghi chú cho △ và 🧪 | Để △ không giải thích |

---

## Checklist

- [ ] §0.3 ký hiệu đã chốt với team
- [ ] Mọi role trong bảng có trong §0.2
- [ ] Module khớp function-list / scope `01`
- [ ] Không mâu thuẫn matrix-design giữa các module
- [ ] FE/BE đã review trước implement guard
- [ ] Link `matrix-design.md` trong task **Design** (scope M+)

Skill: [design-workflow](../../../../.cursor/skills/design-workflow/SKILL.md)
