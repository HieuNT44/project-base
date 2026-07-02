# API Document (Request · Response · Error Code)

Hướng dẫn viết **`{resource}-api.md`** — spec **một endpoint hoặc nhóm endpoint** nội bộ: method, path, request, response, error codes.

**project-base** chỉ có README + template. Khớp [api-error-handling](../../basic-design/api-error-handling/README.md) (envelope, `error.code`, validation `details[]`).

---

## Mục đích

- Đủ để FE/BE/mobile implement và viết test
- Error code **không tự đặt** — dùng bảng master api-error-handling
- Trace tới Screen ID / AC trong `.backlogs/`

Không thay BD **external-interface-overview** — API **của mình** vs contract **bên thứ ba** (→ [interface-specification](../interface-specification/README.md)).

---

## File cần tạo

| File | Nội dung |
|------|----------|
| `{resource}-api.md` | Spec endpoint — từ [_api-document.template.md](./_api-document.template.md) |

Ví dụ: `auth-api.md`, `orders-api.md` — hoặc một file / endpoint nếu lớn.

---

## Cấu trúc đề xuất

### Metadata

Method · path · version · auth · task link · Screen ID (nếu có)

### Request

| Field | In | Type | Required | Validation | Mô tả |
|-------|-----|------|----------|------------|--------|
| `email` | body | string | Yes | email | |

### Response success

HTTP status · JSON mẫu · bảng field response

### Response error

| HTTP | error.code | Tình huống | Message (tham chiếu) |
|------|------------|------------|----------------------|

### Ví dụ JSON

Request / success / 422 validation / 401 / 404 — copy-paste được

---

## Checklist

- [ ] Khớp api-error-handling envelope
- [ ] Mọi 4xx/5xx có `error.code`
- [ ] Link trong task **Design**

Skill: [design-workflow](../../../../.cursor/skills/design-workflow/SKILL.md)
