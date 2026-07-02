# Batch Design (Thiết kế chi tiết batch)

Hướng dẫn viết **`{BT-xxx}-design.md`** — spec **một batch/job**: input, transform, output, schedule, idempotency, error, monitoring.

**project-base** chỉ có README + template. Mỗi file gắn **`BT-xxx`** từ [batch-overview](../../basic-design/batch-overview/README.md).

---

## Mục đích

- BD batch-overview = master list — DD = **đủ để code job**
- Field mapping, volume, chunking, retry chi tiết
- Liên kết [interface-specification](../interface-specification/README.md) nếu gọi API ngoài

---

## File cần tạo

| File | Nội dung |
|------|----------|
| `{BT-xxx}-design.md` | Spec batch — từ [_batch-design.template.md](./_batch-design.template.md) |

---

## Cấu trúc đề xuất

### Metadata

BT ID · tên job · trigger/cron · owner · INT-xxx liên quan

### Input / Output

Bảng nguồn / đích · điều kiện lọc · volume ước tính

### Process steps

| Step | Mô tả | Ghi chú |
|------|--------|---------|

### Transform / mapping

| Source field | Target field | Rule |

### Error & recovery

Retry · DLQ · alert · manual re-run

### Monitoring & SLA

Log · metric · thời gian chạy tối đa

### Sequence *(tuỳ chọn)*

Link sequence-diagram

---

## Phân biệt nhanh

| Tài liệu | Nội dung |
|----------|----------|
| **batch-overview** (BD) | Danh sách BT, schedule tóm tắt |
| **batch-design** (DD) | Logic, mapping, idempotency từng job |
| **interface-specification** | API vendor khi batch gọi ra ngoài |

---

## Checklist

- [ ] BT ID khớp batch-overview
- [ ] Idempotency & retry đã chốt
- [ ] Không trùng giờ cron conflict với batch khác (ghi chú nếu có)
- [ ] Link task **Design**

Skill: [design-workflow](../../../../.cursor/skills/design-workflow/SKILL.md)
