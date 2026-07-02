# Thiết kế kiến trúc Backend — {Tên dự án}

**Cập nhật:** YYYY-MM-DD  
**Người phụ trách:** {Tech Lead BE}

> Copy thành `backend-architecture.md` (cùng thư mục, bỏ prefix `_`). Tham chiếu [system-overview](../system-overview/system-overview.md).

---

## 1. Công nghệ & Hạ tầng cốt lõi (Tech Stack)

| Hạng mục | Công nghệ | Phiên bản | Ghi chú |
|----------|-----------|-----------|---------|
| **Runtime / Framework** | {Node.js / Java Spring / Python FastAPI / …} | | |
| **API style** | {REST / GraphQL / gRPC} | | |
| **Cơ sở dữ liệu** | {PostgreSQL / MySQL / MongoDB / …} | | |
| **ORM / Query** | {Prisma / TypeORM / …} | | |
| **Cache** | {Redis / —} | | Session, rate limit |
| **Message queue** | {SQS / RabbitMQ / —} | | Async job |
| **Auth** | {JWT / OAuth2 / …} | | |
| **Observability** | {Log / APM / …} | | |

---

## 2. Cấu trúc thư mục dự án (Project Directory Structure)

```
backend/
├── src/
│   ├── modules/        # Theo domain (order, user, sync…)
│   ├── common/         # Middleware, filters, utils
│   ├── config/         # Env, constants
│   ├── integrations/   # Client Salesforce, payment…
│   └── jobs/           # Cron / worker (nếu có)
├── tests/
└── …
```

| Thư mục / layer | Trách nhiệm |
|-----------------|-------------|
| `modules/{domain}/` | Controller, service, repository theo domain |
| `common/` | Auth middleware, exception handler, DTO base |
| `integrations/` | Wrapper API bên thứ ba |
| `jobs/` | Batch / queue consumer |

**Kiến trúc layer (gợi ý):** Controller → Service → Repository → DB

---

## 3. Luồng xử lý chung (Common Flows & Cross-cutting)

### 3.1 Authentication & Authorization

| Bước | Mô tả |
|------|--------|
| Login / token issue | |
| Validate token | Middleware / guard |
| Refresh | |
| Phân quyền | RBAC — [matrix-design.md](../matrix-design/matrix-design.md) |

### 3.2 API & Integration

| Quy tắc | Mô tả |
|---------|--------|
| Versioning | {/api/v1/…} |
| Request validation | DTO / schema |
| Gọi Salesforce / bên thứ ba | Qua `integrations/` — timeout, retry — xem [external-interface-overview](../external-interface-overview/README.md) |
| Idempotency | {Khi cần cho payment / sync} |

### 3.3 Error & Logging

| Tình huống | Cách xử lý |
|------------|------------|
| Business error | HTTP 4xx + mã lỗi chuẩn |
| System error | HTTP 5xx + log đầy đủ, không lộ stack ra client |
| Structured log | {JSON log, correlation id} |

### 3.4 Async / Batch

| Job | Trigger | Ghi chú |
|-----|---------|---------|
| {sync-salesforce} | Cron / queue | |

→ Chi tiết batch: [batch-overview.md](../batch-overview/batch-overview.md)

---

## 4. Tiêu chuẩn viết Code & Hiệu năng (Coding Standards & Performance)

### 4.1 Coding Convention

| Mục | Quy ước |
|-----|---------|
| Đặt tên | camelCase (TS/JS) hoặc theo ngôn ngữ |
| API contract | OpenAPI / DD link task **Design** |
| Test | Unit service; integration API |
| Comment | Tiếng Anh |

### 4.2 Performance & NFR

| Kỹ thuật | Áp dụng |
|----------|---------|
| DB index | Theo query thường dùng |
| Pagination | List API |
| Connection pool | DB client |
| Caching | Redis cho read-heavy |
| Rate limit | Gateway hoặc middleware |

→ [NFR](../../../03_non-functional-requirements/catalog.md)

---

## Tài liệu liên quan

| Loại | Đường dẫn |
|------|-----------|
| System Overview | [system-overview.md](../system-overview/system-overview.md) |
| Architecture FE | [frontend-architecture.md](../architecture-fe/frontend-architecture.md) |
| API error handling | [api-error-handling.md](../api-error-handling/api-error-handling.md) |
| Matrix design | [matrix-design.md](../matrix-design/matrix-design.md) |
| Batch overview | [batch-overview.md](../batch-overview/batch-overview.md) |
| External interface overview | [external-interface-overview.md](../external-interface-overview/external-interface-overview.md) |

## Phê duyệt

| | |
|---|---|
| **Người review** | |
| **Ngày** | |
| **Trạng thái** | draft / approved |
