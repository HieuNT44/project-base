# API — `{METHOD} {path}` — {Mô tả ngắn}

**Cập nhật:** YYYY-MM-DD  
**Auth:** {Bearer JWT | Public | …}  
**Task:** `.backlogs/{id}/ready/`  
**Screen:** `{ScreenID}` *(nếu có)*

> Copy thành `{resource}-api.md` (có thể nhiều endpoint / file). Chuẩn lỗi: [api-error-handling](../../basic-design/api-error-handling/README.md).

---

## 1. Tổng quan

| Mục | Giá trị |
|-----|---------|
| Method | `{POST}` |
| Path | `/api/v1/{resource}` |
| Mô tả | {…} |

---

## 2. Request

| Field | In | Type | Required | Validation | Mô tả |
|-------|-----|------|----------|------------|--------|
| `{field}` | body | string | Yes | required, max:255 | |
| `{field}` | query | integer | No | min:1 | |

**Headers:** `Authorization`, `Accept-Language`, …

```json
{
  "{field}": "example"
}
```

---

## 3. Response — Success

**HTTP:** `200` / `201`

| Field | Type | Mô tả |
|-------|------|--------|
| `data.{field}` | string | |

```json
{
  "data": {
    "{field}": "value"
  }
}
```

---

## 4. Response — Error

| HTTP | error.code | Tình huống | Ghi chú |
|------|------------|------------|---------|
| 401 | `unauthorized` | Thiếu / hết token | |
| 422 | `validation_error` | Field không hợp lệ | `details[]` |
| 404 | `not_found` | | |

```json
{
  "error": {
    "code": "validation_error",
    "message": "…",
    "details": [
      { "field": "{field}", "code": "required", "message": "…" }
    ]
  }
}
```

---

## 5. Sequence *(tuỳ chọn)*

Link: [sequence-diagram](../sequence-diagram/{flow-id}-sequence.md)

---

## Phê duyệt

| | |
|---|---|
| **Trạng thái** | draft / approved |
