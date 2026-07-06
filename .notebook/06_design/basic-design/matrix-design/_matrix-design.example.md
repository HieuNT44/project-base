# Matrix Design (Ma trận quyền & chức năng) — UGC Agent

- **Dự án:** UGC Agent
- **Version:** v0.1
- **Cập nhật:** 2026-07-02
- **Phạm vi:** Web SPA — auth, session, chat, admin cơ bản

> Ví dụ điền mẫu. Tham chiếu [02_function-list](../../../02_function-list/catalog.md) · [screen-list](../screen-list/screen-list.md).

---

## 0. Mục lục & quy ước

### 0.1 Danh sách Module / Feature

| STT | Module |
|-----|--------|
| 1 | Auth |
| 2 | Session |
| 3 | Chat |
| 4 | Profile & Settings |
| 5 | Admin |

### 0.2 Danh sách Role

| STT | Role | Mô tả ngắn |
|-----|------|------------|
| 1 | **User** | Người dùng đã đăng ký — dùng chat & quản lý session của mình |
| 2 | **Admin** | Vận hành — quản lý user, xem log, cấu hình hệ thống (phạm vi v0.1) |

### 0.3 Chú thích ký hiệu

| Ký hiệu | Ý nghĩa |
|---------|---------|
| ✅ | Có quyền (full access) |
| 👁️ | Chỉ xem (read-only) |
| ❌ | Không có quyền |
| 🧪 | Chỉ môi trường test / staging |
| △ | Có điều kiện — xem ghi chú dưới bảng |

**Ghi chú role:**

> **User:** Chỉ thao tác trên **session và dữ liệu của chính mình** (owner scope).  
> **Admin:** Full trong module Admin; với Session/Chat của user khác = 👁️ trừ khi ghi ✅ rõ (moderation — planned v0.2).

---

## 1. Auth

| Function | User | Admin |
|----------|------|-------|
| Đăng ký tài khoản | ✅ | ❌ |
| Đăng nhập | ✅ | ✅ |
| Đăng xuất | ✅ | ✅ |
| Đổi mật khẩu (tài khoản của mình) | ✅ | ✅ |
| Reset mật khẩu qua email | ✅ | 🧪 |

---

## 2. Session

| Function | User | Admin |
|----------|------|-------|
| Tạo session chat mới | ✅ | ✅ |
| Xem danh sách session của mình | ✅ | ✅ |
| Đổi tên session của mình | ✅ | ✅ |
| Xóa session của mình | ✅ | ✅ |
| Xem session của user khác | ❌ | 👁️ |
| Xóa session của user khác | ❌ | △ |

_Ghi chú △ Admin xóa session user khác: chỉ khi moderation được bật (`MODERATION_ENABLED=true`) — planned v0.2._

---

## 3. Chat

| Function | User | Admin |
|----------|------|-------|
| Gửi tin nhắn trong session của mình | ✅ | ✅ |
| Xem lịch sử chat session của mình | ✅ | ✅ |
| Export lịch sử chat của mình | ✅ | ❌ |
| Xem lịch sử chat session user khác | ❌ | 👁️ |
| Gửi tin thay user khác | ❌ | ❌ |

---

## 4. Profile & Settings

| Function | User | Admin |
|----------|------|-------|
| Xem / sửa profile của mình | ✅ | ✅ |
| Đổi ngôn ngữ UI (en / vi) | ✅ | ✅ |
| Xem profile user khác | ❌ | 👁️ |

---

## 5. Admin

| Function | User | Admin |
|----------|------|-------|
| Truy cập menu / route `/admin` | ❌ | ✅ |
| Danh sách user | ❌ | 👁️ |
| Khoá / mở khoá user | ❌ | ✅ |
| Xem audit log hệ thống | ❌ | 👁️ |
| Cấu hình rate limit / feature flag | ❌ | 🧪 |

---

## 6. Trạng thái triển khai (Implementation Status)

| Hạng mục | Trạng thái | Ghi chú |
|----------|------------|---------|
| Auth matrix | Partial | Login/register; reset email pending |
| Session owner guard (BE) | Partial | PATCH/DELETE session id mismatch → 403 |
| Chat owner guard | Planned | v0.2 |
| Admin routes (FE) | Planned | `ProtectedRoute` + role `admin` |
| Admin API policies (BE) | Planned | |

---

## 7. Đường dẫn triển khai (Implementation Paths)

| Lớp | Path (khi có code) |
|-----|-------------------|
| FE route guard | `frontend/src/app/ProtectedRoute.tsx` |
| FE role check | `frontend/src/hooks/useAuth.ts` |
| BE auth deps | `backend/app/api/deps/auth.py` |
| BE session authorize | `backend/app/api/v1/auth.py` (session id vs token) |

---

## Tài liệu liên quan

| Loại | Đường dẫn |
|------|-----------|
| Architecture FE | [frontend-architecture.example.md](../architecture-fe/_frontend-architecture.example.md) § Routing & Permission |
| Architecture BE | [backend-architecture.md](../architecture-be/backend-architecture.md) |
| Screen list | [screen-list.md](../screen-list/screen-list.md) |
| API error (403) | [api-error-handling.example.md](../api-error-handling/api-error-handling.example.md) |

## Phê duyệt

| | |
|---|---|
| **Người review** | |
| **Ngày** | |
| **Trạng thái** | draft |
