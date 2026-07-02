# Batch Design — `{BT-xxx}` — {Tên batch}

**Cập nhật:** YYYY-MM-DD  
**Batch ID:** `{BT-xxx}`  
**Overview:** [batch-overview](../../basic-design/batch-overview/batch-overview.md)  
**Trigger:** `{0 2 * * *}` · Timezone: `{Asia/Tokyo}`  
**Task:** `.backlogs/{id}/ready/`

> Copy thành `{BT-xxx}-design.md`.

---

## 1. Tóm tắt

| Mục | Giá trị |
|-----|---------|
| Mục đích | {…} |
| Loại | Scheduled / Event-driven / Queue |
| Interface liên quan | `{INT-xxx}` *(nếu có)* |

---

## 2. Input

| Nguồn | Điều kiện lọc | Volume ước tính | Ghi chú |
|-------|---------------|-----------------|---------|
| `{table}` / `{API}` | `{delta since last_run}` | {N records/run} | |

---

## 3. Output

| Đích | Hành động | Ghi chú |
|------|-----------|---------|
| `{Salesforce}` / `{table}` | Upsert / Insert | |

---

## 4. Process steps

| Step | Mô tả | Ghi chú |
|------|--------|---------|
| 1 | Lấy batch cursor / watermark | |
| 2 | Validate & transform | |
| 3 | Gọi API / ghi DB | Chunk size: {500} |
| 4 | Cập nhật sync log | |

---

## 5. Field mapping

| Source | Target | Transform |
|--------|--------|-----------|
| `users.email` | `Contact.Email` | lowercase trim |

---

## 6. Idempotency & concurrency

| Mục | Quy ước |
|-----|---------|
| Idempotency key | `{field}` |
| Chạy song song | Không / partition theo `{key}` |
| Lock | {DB advisory lock / Redis} |

---

## 7. Error & recovery

| Tình huống | Hành động |
|------------|-----------|
| Lỗi 1 record | Skip + log / fail cả batch |
| API timeout | Retry {3x}, backoff |
| Partial fail | {alert Slack, DLQ table} |

---

## 8. Monitoring

| Mục | Giá trị |
|-----|---------|
| Log correlation id | `{batch_run_id}` |
| SLA max duration | {30 min} |
| Alert | {#ops} khi fail |

---

## Tài liệu liên quan

| Loại | Path |
|------|------|
| Interface spec | `../interface-specification/{INT-xxx}-spec.md` |
| Sequence | `../sequence-diagram/{flow-id}-sequence.md` |
