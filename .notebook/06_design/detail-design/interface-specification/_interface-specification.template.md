# Interface Specification — `{INT-xxx}` — {Tên hệ thống bên ngoài}

**Cập nhật:** YYYY-MM-DD  
**Interface ID:** `{INT-xxx}`  
**Direction:** {Outbound | Inbound | Bidirectional}  
**Overview:** [external-interface-overview](../../basic-design/external-interface-overview/external-interface-overview.md)  
**Task:** `.backlogs/{id}/ready/`

> Copy thành `{INT-xxx}-spec.md`.

---

## 1. Kết nối

| Mục | Giá trị |
|-----|---------|
| Base URL | `{https://…}` |
| Protocol | REST JSON / SOAP / Webhook / … |
| Auth | OAuth 2.0 / API Key / HMAC / … |
| Timeout | {30s} |
| Retry | {3x, idempotent only} |
| Rate limit | {vendor doc} |

---

## 2. Operations

| Op ID | Tên | Method / trigger | Direction | Mô tả |
|-------|-----|------------------|-----------|--------|
| `OP-01` | {Sync contacts} | `POST /services/…` | Outbound | |
| `OP-02` | {Payment callback} | Webhook `POST /webhooks/…` | Inbound | |

---

## 3. Operation `OP-01` — {Tên}

### Request

| Field | Type | Required | Mô tả | Mapping nội bộ |
|-------|------|----------|--------|----------------|
| `{field}` | string | Yes | | `users.email` |

```json
{
  "{field}": "example"
}
```

### Response success

| Field | Type | Mô tả | Mapping nội bộ |
|-------|------|--------|----------------|
| `{field}` | string | | |

### Response / vendor error

| HTTP / code | Ý nghĩa | Xử lý hệ thống |
|-------------|---------|----------------|
| 401 | Token hết hạn | Refresh token / alert |
| 429 | Rate limit | Backoff |

---

## 4. Operation `OP-02` — Webhook *(Inbound)*

| Mục | Giá trị |
|-----|---------|
| Path nội bộ | `POST /api/webhooks/{vendor}` |
| Verify signature | {HMAC header …} |
| Idempotency | {key field} |

---

## 5. Field mapping tổng hợp *(tuỳ chọn)*

| Nội bộ | External | Transform |
|--------|----------|-----------|
| `users.salesforce_id` | `Contact.Id` | |

---

## Tài liệu liên quan

| Loại | Path |
|------|------|
| Batch sync | `../batch-design/{BT-xxx}-design.md` |
| Sequence | `../sequence-diagram/{flow-id}-sequence.md` |
| API nội bộ (expose) | `../api-document/{resource}-api.md` |
