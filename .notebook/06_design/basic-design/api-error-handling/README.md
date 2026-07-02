# API Error Handling (Xử lý lỗi API)

Hướng dẫn viết tài liệu **`api-error-handling.md`** — quy ước **lỗi API** cho toàn dự án: format response, mã lỗi, HTTP status, validation, đa ngôn ngữ, cách FE/mobile/BFF xử lý.

**project-base** chỉ có README này. Mỗi dự án tạo file `api-error-handling.md` trong thư mục này khi đã có API (thường sau [architecture-be](../architecture-be/_backend-architecture.template.md)).

---

## Mục đích

Trả lời cho BE, FE, mobile, QA cùng một bộ câu hỏi:

- Success / error response **trông như thế nào** (JSON envelope)?
- Lỗi 401 vs 403 vs 422 — **khi nào** dùng status nào, `error.code` nào?
- Validation trả **field-level** thế nào?
- Message **đa ngôn ngữ** — client gửi header gì, server lấy message ở đâu?
- Endpoint cụ thể (login, register…) map **tình huống → status + code** ra sao?
- Client **bắt lỗi** theo `error.code` (không parse message bằng string)?

Không thay thế spec từng endpoint (DD — link task **Design**) — đây là **chuẩn chung** mọi API.

---

## Khi nào viết

- Trước hoặc song song implement API đầu tiên
- Khi có nhiều client (web, app, BFF) cần xử lý lỗi thống nhất
- Sau khi chốt stack BE (Laravel, Node, …) — ghi thêm mục **Implementation** (file/class thật trong repo)

Tóm tắt lỗi UI toàn hệ thống (không chỉ API) — bổ sung doc riêng của dự án nếu cần.

---

## File cần tạo

| File | Ai điền |
|------|---------|
| `api-error-handling.md` | Tech Lead BE + review FE — **một file chính** cho dự án |

Header gợi ý: **Dự án** · **Version** · **Ngày cập nhật**

---

## Cấu trúc đề xuất (`api-error-handling.md`)

Viết theo các mục dưới — bỏ mục không áp dụng; thêm mục nếu dự án cần.

### 1. Nguyên tắc

Bảng ngắn: HTTP status chuẩn, mã lỗi duy nhất, đa ngôn ngữ, validation có `details`, v.v.

**Quy ước client** (bắt buộc nên có):

- Phân loại bằng **HTTP status** + **`error.code`** — không trả lỗi nghiệp vụ với HTTP 200 + `success: false`
- Envelope success: ví dụ `{ "data": ... }` hoặc quy ước dự án
- Envelope error: ví dụ `{ "error": { "code", "message", "details?" } }`
- JSON naming: `snake_case` / `camelCase` (chốt một)

Ghi **Implementation** (đường dẫn file thật): global exception handler, error resource, lang files, base exception class.

### 2. Cấu trúc error response

- JSON mẫu **lỗi thông thường**
- JSON mẫu **lỗi validation** (có `details[]`: `field`, `message`, `code`)
- Bảng mô tả từng field trong `error`

### 3. Error codes & messages

**3.1 Client errors (4xx)** — bảng: Status | Error Code | Message (EN) | Message (JA) | …

**3.2 Server errors (5xx)** — tương tự

**3.3 Endpoint mapping** *(khuyến nghị)* — Endpoint | Tình huống | Status | Error Code  
(Ví dụ: `POST /auth/login` sai password → 401 `invalid_credentials`)

### 4. Validation rules

- **4.1** Common rules (`required`, `email`, `min`, …) — EN/JA hoặc locale dự án
- **4.2** Field-specific (email, password, …) — rule theo domain
- **4.3** Format `details[]` khi 422

### 5. Validation codes

Bảng mã trong `details[].code` (`required`, `min_length`, `unique`, …) — ổn định, không phụ thuộc locale.

### 6. HTTP status codes summary

Bảng tóm tắt: 200/201/204 success; 400/401/403/404/409/422/429; 5xx — **use case** ngắn.

### 7. Ví dụ error responses

Copy JSON thật cho từng nhóm: 401, 403, 404, 409, 422, 429 (+ header `Retry-After` nếu có), 500.

### 8. Language negotiation

Header (`Accept-Language`), locale mặc định, nguồn message (`lang/{locale}/errors.php`, …).

### 9. Client integration

- **Mobile / SPA:** interceptor — switch theo `error.code`, map `validation_error` → form
- **BFF** (nếu có): forward header, không lộ token, không match message bằng string

### 10. Implementation status *(tuỳ chọn)*

Bảng Done / Chưa / Một phần — đồng bộ với code thực tế khi triển khai dần.

---

## Nguyên tắc viết (base-project)

| Nên | Không nên |
|-----|-----------|
| Mã lỗi **ổn định** (`invalid_credentials`) | Message tiếng Anh hard-code làm key client |
| Một bảng master error codes | Mỗi endpoint tự đặt code khác kiểu |
| Ví dụ JSON copy-paste được | Chỉ mô tả chung chung |
| Ghi path file implement trong repo dự án | Copy nguyên doc dự án khác (RealRead…) vào base |

---

## Phân biệt nhanh

| Tài liệu | Nội dung |
|----------|----------|
| **api-error-handling** | Chuẩn lỗi API toàn hệ thống |
| DD API từng endpoint | Link task **Design** |
| `matrix-design` | Ma trận quyền |
| `batch-overview` | Danh sách job chạy ngầm |
| `external-interface-overview` | Danh mục tích hợp bên thứ ba |

---

## Checklist trước khi coi là xong

- [ ] Success và error envelope đã chốt
- [ ] Bảng 4xx/5xx + mapping endpoint quan trọng (auth, CRUD chính)
- [ ] Validation `details[]` format thống nhất
- [ ] FE/mobile đã đọc — xử lý theo `error.code`
- [ ] Implementation paths (handler, lang) khớp code
- [ ] Link `api-error-handling.md` trong task `.backlogs/` mục **Design** (nếu scope API)

Skill: [design-workflow](../../../../.cursor/skills/design-workflow/SKILL.md)
