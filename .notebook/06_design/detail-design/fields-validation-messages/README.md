# Fields · Validation · Messages (DD — spec màn hình)

Hướng dẫn viết tài liệu **`{ScreenID}-fields.md`** — spec **đủ để implement** form / input trên một màn: danh sách field, rule validate, message hiển thị (inline, toast, dialog).

**project-base** chỉ có README + template. Dự án tạo file theo **Screen ID** từ [screen-list](../../basic-design/screen-list/_screen-list.template.md) khi chuẩn bị code UI (sau Basic Design, trước Develop).

---

## Mục đích

Trả lời cho BA, FE, BE, QA:

- Màn **{ScreenID}** có **những field nào**? Kiểu UI, bắt buộc, default, readonly?
- **Validate** ở client / server / cả hai? Rule và tham số?
- **Message** nào hiển thị khi lỗi / thành công / xác nhận? Mã message ổn định?
- Field **phụ thuộc điều kiện** (ẩn/hiện, enable/disable) ra sao?

Không thay thế layout pixel-perfect (Figma) — DD bổ sung **hành vi & dữ liệu**. Không lặp AC — link task `.backlogs/`.

---

## Khi nào viết

- Task scope M+ có màn form / nhập liệu
- Đã có Screen ID trong `screen-list`
- Trước implement component form
- Cập nhật khi đổi field, rule, hoặc copy message

---

## File cần tạo

| File | Nội dung |
|------|----------|
| `{ScreenID}-fields.md` | 3 bảng chuẩn + ghi chú điều kiện — từ [_screen-fields.template.md](./_screen-fields.template.md) |

Header gợi ý: **Dự án** · **Screen ID** · **Tên màn** · **Version** · **Ngày**

---

## Cấu trúc đề xuất (`{ScreenID}-fields.md`)

### 0. Metadata & tham chiếu

| Mục | Giá trị |
|-----|---------|
| Screen ID | `{A001}` |
| Tên màn | `{Đăng nhập}` |
| Path | `{/login}` |
| Figma | `{link}` |
| Task backlog | `.backlogs/{id}/ready/` |
| API liên quan | `{POST /auth/login}` — DD riêng nếu có |

### 1. Bảng Fields (Field definition)

**Một dòng = một field / control** trên màn (kể cả hidden, readonly).

| # | Field ID | Label (UI) | Component | Data type | Required | Default | Placeholder | Max length | Readonly | Visible | Ghi chú |
|---|----------|------------|-----------|-----------|----------|---------|-------------|------------|----------|---------|---------|
| 1 | `email` | Email | TextField | string | Yes | — | `example@…` | 255 | No | Always | Trim, lowercase |
| 2 | `password` | Mật khẩu | PasswordField | string | Yes | — | — | 128 | No | Always | Mask input |

**Quy ước cột:**

| Cột | Ý nghĩa |
|-----|---------|
| **Field ID** | Tên property trong form state / API payload — `snake_case` hoặc `camelCase` (chốt một theo architecture-fe) |
| **Component** | TextField, Select, DatePicker, RadioGroup, … |
| **Data type** | string, number, boolean, date, file, array, object |
| **Required** | Yes / No / Conditional — nếu Conditional ghi rule ở §4 |
| **Visible** | Always / Conditional / Hidden — mô tả điều kiện ở §4 |

### 2. Bảng Validation (Validation rules)

**Một dòng = một rule** áp dụng cho field (có thể nhiều rule / field).

| Rule ID | Field ID | Layer | Rule | Params | Trigger | Message ID | Ghi chú |
|---------|----------|-------|------|--------|---------|------------|---------|
| `V-A001-01` | `email` | Client + Server | `required` | — | onBlur, submit | `MSG-A001-E01` | |
| `V-A001-02` | `email` | Client + Server | `email` | — | onBlur | `MSG-A001-E02` | |
| `V-A001-03` | `password` | Server only | `invalid_credentials` | — | API 401 | `MSG-A001-E04` | Map `error.code` từ API |

**Quy ước cột:**

| Cột | Ý nghĩa |
|-----|---------|
| **Layer** | `Client` · `Server` · `Client + Server` |
| **Rule** | `required`, `min_length`, `max_length`, `pattern`, `email`, `unique`, … hoặc mã API (`invalid_credentials`) |
| **Params** | Ví dụ `min: 8`, regex, enum values |
| **Trigger** | `onChange`, `onBlur`, `submit`, `API response` |
| **Message ID** | Tham chiếu bảng §3 — **không** ghi full text dài trong bảng này |

Rule server và `details[].code` phải khớp [api-error-handling](../../basic-design/api-error-handling/README.md) §4–5.

### 3. Bảng Messages (UI & validation copy)

**Một dòng = một message** có mã ổn định (FE/BE dùng mã, không parse text).

| Message ID | Loại | Ngữ cảnh | VI | EN | JA | Hiển thị | Ghi chú |
|------------|------|----------|----|----|-----|----------|---------|
| `MSG-A001-E01` | Error | Validation | Vui lòng nhập email | Please enter email | … | Inline dưới field `email` | |
| `MSG-A001-E04` | Error | API | Email hoặc mật khẩu không đúng | … | … | Toast / banner form | `error.code`: `invalid_credentials` |
| `MSG-A001-S01` | Success | Submit | Đăng nhập thành công | … | … | Toast | Sau redirect — xem screen-flow |

**Quy ước cột:**

| Cột | Ý nghĩa |
|-----|---------|
| **Loại** | `Error` · `Warning` · `Info` · `Success` · `Confirm` |
| **Ngữ cảnh** | `Validation` · `API` · `Business` · `Empty state` |
| **Hiển thị** | Inline field · Toast · Dialog · Banner · Snackbar |

Locale: thêm cột theo dự án; message API có thể lấy từ server — ghi rõ nguồn (client i18n vs API `message`).

### 4. Điều kiện hiển thị / phụ thuộc *(khi có)*

| Field ID | Điều kiện | Hành vi |
|----------|-----------|---------|
| `company_name` | `user_type === 'business'` | Visible + Required |
| `otp_code` | Sau bước gửi OTP | Visible |

### 5. Sự kiện form *(tuỳ chọn)*

| Sự kiện | Hành vi | Message ID | Chuyển màn |
|---------|---------|------------|------------|
| Submit OK | Gọi API → lưu session | `MSG-A001-S01` | `D001` — xem [screen-flow](../../basic-design/screen-flow/README.md) |
| Submit fail validation | Dừng, focus field đầu lỗi | — | — |

---

## Phân biệt nhanh

| Tài liệu | Nội dung |
|----------|----------|
| **fields-validation-messages** (DD) | Field + rule + copy theo **từng màn** |
| **screen-list** (BD) | Danh sách màn, Screen ID |
| **screen-flow** (BD) | Chuyển màn sau submit |
| **api-error-handling** (BD) | Chuẩn lỗi API toàn hệ thống |
| **Figma** | Layout, spacing, visual |

---

## Nguyên tắc (base-project)

| Nên | Không nên |
|-----|-----------|
| Field ID thống nhất form ↔ API | Mỗi màn đặt tên field khác kiểu |
| Message ID ổn định (`MSG-{ScreenID}-…`) | Chỉ ghi text tiếng Việt, không mã |
| Rule server khớp `api-error-handling` | Mỗi form tự đặt error code |
| Một dòng một field / một rule | Gộp “email + password validate như thường” |
| Link Screen ID + task backlog | Doc mồ côi không trace AC |

---

## Checklist

- [ ] Screen ID khớp `screen-list`
- [ ] Mọi field trên UI có trong bảng §1
- [ ] Mọi rule có Message ID trong §3
- [ ] Server rules khớp api-error-handling
- [ ] Submit success/fail có message + screen-flow
- [ ] Link `{ScreenID}-fields.md` trong task **Design**

Skill: [design-workflow](../../../../.cursor/skills/design-workflow/SKILL.md)
