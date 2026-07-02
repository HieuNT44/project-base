# Logic Design (Thiết kế logic nghiệp vụ)

Hướng dẫn viết **`{feature}-logic.md`** — **điều kiện, nhánh, quy tắc xử lý** nghiệp vụ (pseudo-code / bảng quyết định), không phụ thuộc ngôn ngữ.

**project-base** chỉ có README + template. Dùng trước hoặc song song [sequence-diagram](../sequence-diagram/README.md) và [class-design](../class-design/README.md).

---

## Mục đích

- AC phức tạp → bước xử lý rõ ràng cho BE/FE
- Điều kiện if/else, state machine, tính toán
- Trace `.backlogs/` AC từng dòng

Không lặp toàn bộ field UI — tham chiếu [fields-validation-messages](../fields-validation-messages/README.md).

---

## File cần tạo

| File | Nội dung |
|------|----------|
| `{feature}-logic.md` | Luồng + bảng quy tắc — từ [_logic-design.template.md](./_logic-design.template.md) |

---

## Cấu trúc đề xuất

### 1. Metadata

Feature · AC link · Screen ID · API liên quan

### 2. Tóm tắt luồng (bullet hoặc flowchart Mermaid)

### 3. Bảng xử lý chính

| Step | Điều kiện | Hành động | Kết quả | Ghi chú |
|------|-----------|-----------|---------|---------|

### 4. Bảng quy tắc / validation nghiệp vụ

| Rule ID | Điều kiện | Kết quả | Message / error.code |
|---------|-----------|---------|----------------------|

### 5. State machine *(khi có)*

| Trạng thái hiện tại | Sự kiện | Trạng thái mới | Hành động |
|---------------------|---------|----------------|-----------|

---

## Checklist

- [ ] Mọi AC liên quan có step tương ứng
- [ ] error.code khớp api-error-handling
- [ ] Link sequence / api nếu có

Skill: [design-workflow](../../../../.cursor/skills/design-workflow/SKILL.md)
