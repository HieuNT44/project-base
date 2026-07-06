# Design — Theo dõi trạng thái vận chuyển đơn hàng

**ID:** example_001  
**Ready task:** [example_001](../ready/example_001.md)  
**Scope:** M

---

## 1. Tài liệu design

| File / doc | Action | Path | Ảnh hưởng code |
|------------|--------|------|----------------|
| screen-flow | update | `.notebook/06_design/basic-design/screen-flow/screen-flow.md` | D001 → D004 timeline |
| api-document | create | `.notebook/06_design/detail-design/api-document/order-shipment-timeline-api.md` | `GET /orders/{id}/shipment-timeline` |
| sequence-diagram | create | `.notebook/06_design/detail-design/sequence-diagram/order-timeline-ghn-sequence.md` | FE → BE → GHN |
| fields-validation-messages | update | `.notebook/06_design/detail-design/fields-validation-messages/D004-fields.md` | Màn Chi tiết đơn hàng |
| external-interface-overview | read | `.notebook/06_design/basic-design/external-interface-overview/` | INT GHN |

---

## 2. Kế hoạch triển khai (cơ bản)

1. Chốt contract API timeline + map trạng thái GHN.
2. Sequence FE–BE–GHN; error handling theo `api-error-handling`.
3. DD field màn D004; implement BE → FE.

---

## 3. Handoff — Code

### Thứ tự code

1. `backend/` — endpoint timeline + GHN client + cache.
2. `frontend/` — component `ShipmentTimeline` trên page Order Detail.
3. Test T1–T4 trên `ready` §6.

### File code dự kiến

| Layer | Path _(khi có repo app)_ |
|-------|--------------------------|
| BE API | `backend/app/api/v1/orders.py` |
| BE integration | `backend/app/services/ghn_client.py` |
| FE page | `frontend/src/pages/OrderDetail/` |
| FE component | `frontend/src/features/order/components/ShipmentTimeline/` |

### AC → doc / module

| AC | Module / doc |
|----|----------------|
| AC 1–3 | `order-shipment-timeline-api.md`, `D004-fields.md` |
| NFR perf | Cache TTL 60s; timeout GHN 5s |
