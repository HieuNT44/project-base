# {ScreenID} — {Tên màn hình} — Fields · Validation · Messages

**Cập nhật:** YYYY-MM-DD

> Copy thành `{ScreenID}-fields.md` (cùng thư mục). Screen ID khớp [screen-list](../../basic-design/screen-list/_screen-list.template.md).

---

## 0. Metadata

| Mục | Giá trị |
|-----|---------|
| Screen ID | `{ScreenID}` |
| Tên màn | `{Tên màn hình}` |
| Path | `{/path}` |
| Figma | |
| Task backlog | `.backlogs/{id}/ready/` |
| API liên quan | |

---

## 1. Fields

| # | Field ID | Label (UI) | Component | Data type | Required | Default | Placeholder | Max length | Readonly | Visible | Ghi chú |
|---|----------|------------|-----------|-----------|----------|---------|-------------|------------|----------|---------|---------|
| 1 | `{field_id}` | {Label} | {TextField} | string | Yes | — | — | — | No | Always | |
| 2 | `{field_id}` | {Label} | {Select} | string | No | — | — | — | No | Always | |

---

## 2. Validation

| Rule ID | Field ID | Layer | Rule | Params | Trigger | Message ID | Ghi chú |
|---------|----------|-------|------|--------|---------|------------|---------|
| `V-{ScreenID}-01` | `{field_id}` | Client + Server | required | — | submit | `MSG-{ScreenID}-E01` | |
| `V-{ScreenID}-02` | `{field_id}` | Client + Server | email | — | onBlur | `MSG-{ScreenID}-E02` | |

---

## 3. Messages

| Message ID | Loại | Ngữ cảnh | VI | EN | Hiển thị | Ghi chú |
|------------|------|----------|----|----|----------|---------|
| `MSG-{ScreenID}-E01` | Error | Validation | {…} | {…} | Inline | |
| `MSG-{ScreenID}-S01` | Success | Submit | {…} | {…} | Toast | |

---

## 4. Điều kiện hiển thị *(khi có)*

| Field ID | Điều kiện | Hành vi |
|----------|-----------|---------|
| | | |

---

## 5. Sự kiện form *(tuỳ chọn)*

| Sự kiện | Hành vi | Message ID | Chuyển màn |
|---------|---------|------------|------------|
| Submit OK | | `MSG-{ScreenID}-S01` | |
| Submit fail validation | Focus field đầu lỗi | — | — |
