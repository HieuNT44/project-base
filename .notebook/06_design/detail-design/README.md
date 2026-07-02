# Detail Design (Thiết kế chi tiết)

Spec **đủ để implement** — link từ `.backlogs/{id}/design/{id}.md` mục **Artifacts**. Viết sau [basic-design](../basic-design/README.md).

## Cấu trúc

```
detail-design/
├── README.md
├── fields-validation-messages/   # Field · validate · message (theo Screen ID)
├── database-erd/
├── database-table-definition/
├── database-data-dictionary/
├── api-document/
├── sequence-diagram/
├── class-design/
├── logic-design/
├── interface-specification/
└── batch-design/
```

Mỗi thư mục: **README** (hướng dẫn) + **`_*.template.md`** (copy & điền).

## Artifact index

| Thư mục | File dự án tạo | Khi dùng |
|---------|----------------|----------|
| [fields-validation-messages](./fields-validation-messages/README.md) | `{ScreenID}-fields.md` | Form / input trên màn |
| [database-erd](./database-erd/README.md) | `erd.md` hoặc `{module}-erd.md` | Quan hệ entity / bảng |
| [database-table-definition](./database-table-definition/README.md) | `{table_name}.md` | Cột, PK/FK, index, constraint |
| [database-data-dictionary](./database-data-dictionary/README.md) | `data-dictionary.md` | Ý nghĩa nghiệp vụ từng field |
| [api-document](./api-document/README.md) | `{resource}-api.md` | Request, response, error |
| [sequence-diagram](./sequence-diagram/README.md) | `{flow-id}-sequence.md` | Luồng tương tác theo thời gian |
| [class-design](./class-design/README.md) | `{module}-class.md` | Class / module / responsibility |
| [logic-design](./logic-design/README.md) | `{feature}-logic.md` | Điều kiện, nhánh, xử lý nghiệp vụ |
| [interface-specification](./interface-specification/README.md) | `{INT-xxx}-spec.md` | Contract tích hợp bên ngoài |
| [batch-design](./batch-design/README.md) | `{BT-xxx}-design.md` | Spec chi tiết từng batch |

## Thứ tự gợi ý (theo loại việc)

**Data:** ERD → table definition → data dictionary  
**API / tích hợp:** interface-specification (nếu external) · api-document · sequence-diagram  
**Logic:** logic-design · class-design  
**UI:** fields-validation-messages  
**Batch:** batch-design (sau [batch-overview](../basic-design/batch-overview/README.md))

Skill: [design-workflow](../../../.cursor/skills/design-workflow/SKILL.md)
