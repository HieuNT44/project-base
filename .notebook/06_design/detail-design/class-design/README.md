# Class Design (Thiết kế lớp / module)

Hướng dẫn viết **`{module}-class.md`** — cấu trúc **class / module / service**: trách nhiệm, thuộc tính, method chính, phụ thuộc.

**project-base** chỉ có README + template. Khớp [architecture-be](../../basic-design/architecture-be/_backend-architecture.template.md) hoặc architecture-fe.

---

## Mục đích

- Chia trách nhiệm trước khi code (service layer, repository, use case)
- Liên kết [logic-design](../logic-design/README.md) với cấu trúc code
- Không thay thế code — DD là blueprint

---

## File cần tạo

| File | Nội dung |
|------|----------|
| `{module}-class.md` | Diagram + bảng class — từ [_class-design.template.md](./_class-design.template.md) |

---

## Cấu trúc đề xuất

### 1. Sơ đồ (Mermaid `classDiagram` hoặc bảng module)

### 2. Bảng Class / Module

| Class / Module | Layer | Trách nhiệm | Phụ thuộc | Ghi chú |
|----------------|-------|-------------|-----------|---------|

### 3. Bảng Method (public) — từng class quan trọng

| Class | Method | Input | Output | Mô tả | Gọi từ |
|-------|--------|-------|--------|-------|--------|

---

## Checklist

- [ ] Khớp folder structure architecture-be/fe
- [ ] Không god class — trách nhiệm rõ
- [ ] Link logic-design / api-document

Skill: [design-workflow](../../../../.cursor/skills/design-workflow/SKILL.md)
