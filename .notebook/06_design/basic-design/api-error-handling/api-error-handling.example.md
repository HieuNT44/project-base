# API Error Handling — UGC Agent

- **Project:** UGC Agent
- **Version:** v0.1
- **Last updated:** 2026-07-02
- **Scope:** Backend FastAPI (auth/session/chat + upcoming UGC APIs)

---

## 1. Principles

| Principle | Rule |
|---|---|
| HTTP semantics first | Do not return business errors with HTTP 200 |
| Stable machine code | Client handles errors by `error.code`, not by parsing `message` |
| Unified envelope | Success and error responses use one shared contract |
| Locale-aware message | Message can vary by `Accept-Language`; code must not change |
| Validation details | HTTP 422 always returns field-level `details[]` |
| Traceability | Every error includes `request_id` for log correlation |

### 1.1 JSON naming

- API response uses `snake_case`.

### 1.2 Success envelope

```json
{
  "data": {},
  "meta": {
    "request_id": "req_123"
  }
}
```

### 1.3 Error envelope

```json
{
  "error": {
    "code": "invalid_credentials",
    "message": "Incorrect email or password",
    "details": [],
    "request_id": "req_123"
  }
}
```

---

## 2. Error Response Structure

| Field | Type | Required | Description |
|---|---|---|---|
| `error.code` | string | yes | Stable machine-readable code |
| `error.message` | string | yes | Human-readable message based on locale |
| `error.details` | array | no | Field-level errors or sub-errors |
| `error.request_id` | string | yes | Correlation id for tracing logs |

### 2.1 Validation error details item

```json
{
  "field": "password",
  "code": "min_length",
  "message": "Password must be at least 8 characters long"
}
```

---

## 3. Error Codes and Messages

### 3.1 Client errors (4xx)

| HTTP | Error code | Message (EN) | Usage |
|---|---|---|---|
| 400 | `bad_request` | Invalid request | Invalid payload/query at request level |
| 401 | `unauthorized` | Authentication required | Missing token |
| 401 | `invalid_credentials` | Incorrect email or password | Invalid login credentials |
| 401 | `invalid_token` | Invalid authentication credentials | JWT invalid or expired |
| 403 | `forbidden` | You do not have permission | Authenticated but not allowed |
| 404 | `not_found` | Resource not found | Target resource does not exist |
| 404 | `user_not_found` | User not found | Token valid but user missing |
| 404 | `session_not_found` | Session not found | Session does not exist |
| 409 | `conflict` | Resource conflict | Data/state conflict |
| 409 | `email_already_registered` | Email already registered | Duplicate email at register |
| 422 | `validation_error` | Validation failed | Field-level validation error |
| 429 | `rate_limited` | Too many requests | Rate limit exceeded |

### 3.2 Server errors (5xx)

| HTTP | Error code | Message (EN) | Usage |
|---|---|---|---|
| 500 | `internal_error` | Internal server error | Unexpected server-side failure |
| 502 | `upstream_error` | Upstream service error | Error from external LLM/provider |
| 503 | `service_unavailable` | Service temporarily unavailable | Service temporarily unavailable |
| 504 | `gateway_timeout` | Upstream timeout | External dependency timeout |

### 3.3 Endpoint mapping (current scope)

| Endpoint | Scenario | HTTP | Error code |
|---|---|---|---|
| `POST /api/v1/auth/register` | Email already exists | 409 | `email_already_registered` |
| `POST /api/v1/auth/register` | Password policy violation | 422 | `validation_error` |
| `POST /api/v1/auth/login` | Wrong email/password | 401 | `invalid_credentials` |
| `POST /api/v1/auth/login` | `grant_type` is not `password` | 400 | `bad_request` |
| `POST /api/v1/auth/session` | Token invalid/expired | 401 | `invalid_token` |
| `PATCH /api/v1/auth/session/{id}/name` | Session id mismatch with token | 403 | `forbidden` |
| `DELETE /api/v1/auth/session/{id}` | Session id mismatch with token | 403 | `forbidden` |

---

## 4. Validation Rules

### 4.1 Common rules

- `required`
- `type_mismatch`
- `invalid_format`
- `min_length`
- `max_length`
- `enum_invalid`

### 4.2 Field-specific rules (auth v0)

- `email`: must be a valid email format
- `password`:
  - minimum length is 8
  - at least one uppercase letter
  - at least one lowercase letter
  - at least one number
  - at least one special character

### 4.3 HTTP 422 response format

```json
{
  "error": {
    "code": "validation_error",
    "message": "Validation failed",
    "details": [
      {
        "field": "email",
        "code": "invalid_format",
        "message": "Invalid email format"
      }
    ],
    "request_id": "req_123"
  }
}
```

---

## 5. Validation Codes

| Code | Meaning |
|---|---|
| `required` | Required field is missing |
| `invalid_format` | Invalid value format |
| `min_length` | Value does not meet minimum length |
| `max_length` | Value exceeds maximum length |
| `not_unique` | Value must be unique but is duplicated |
| `enum_invalid` | Value is not in allowed enum |

---

## 6. HTTP Status Summary

| HTTP | Use case |
|---|---|
| 200 | Success with response body |
| 201 | Resource created successfully |
| 204 | Success with no response body |
| 400 | Invalid request at protocol/pre-check level |
| 401 | Not authenticated or token invalid |
| 403 | Authenticated but forbidden |
| 404 | Resource not found |
| 409 | Data/state conflict |
| 422 | Field-level validation error |
| 429 | Too many requests |
| 500+ | Server or upstream errors |

---

## 7. Example Error Responses

### 7.1 HTTP 401 invalid token

```json
{
  "error": {
    "code": "invalid_token",
    "message": "Invalid authentication credentials",
    "request_id": "req_abc"
  }
}
```

### 7.2 HTTP 403 forbidden

```json
{
  "error": {
    "code": "forbidden",
    "message": "Cannot modify other sessions",
    "request_id": "req_def"
  }
}
```

### 7.3 HTTP 409 email exists

```json
{
  "error": {
    "code": "email_already_registered",
    "message": "Email already registered",
    "request_id": "req_ghi"
  }
}
```

### 7.4 HTTP 429 rate limited

```json
{
  "error": {
    "code": "rate_limited",
    "message": "Too many requests",
    "request_id": "req_xyz"
  }
}
```

Headers:

- `Retry-After: <seconds>`

---

## 8. Language Negotiation

- Client sends `Accept-Language` (for example: `en`, `vi`).
- Default locale fallback is `en`.
- `error.code` is always stable; only `error.message` is localized.

---

## 9. Client Integration Contract

- FE/BFF must switch behavior by `error.code`.
- Form validation maps from `details[]` by `field`.
- Do not match by full `message` text.
- Always log/show `request_id` for support and debugging.

---

## 10. Implementation Status

| Area | Status | Notes |
|---|---|---|
| Unified error envelope | Partial | Some endpoints still return FastAPI default `detail` |
| Auth error code mapping | Partial | Can be standardized with a global exception handler |
| Validation details contract | Pending | Needs normalized mapping from Pydantic/FastAPI errors |
| Locale support | Pending | Full i18n for messages is not enabled yet |
| Request ID in response | Partial | Logging context exists; response propagation should be completed |

---

## 11. Current Implementation Paths

- Auth routes: `backend/app/api/v1/auth.py`
- Token utilities: `backend/app/utils/auth.py`
- Auth schemas: `backend/app/schemas/auth.py`
- Core config: `backend/app/core/config.py`
- Rate limiter: `backend/app/core/limiter.py`
- Logging context: `backend/app/core/logging.py`
