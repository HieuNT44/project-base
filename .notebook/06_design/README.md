# Design

Basic Design (BD) và Detail Design (DD). Tài liệu BD nằm trong [`basic-design/`](./basic-design/).

## Structure

```
06_design/
├── basic-design/
│   ├── system-overview/
│   ├── architecture-fe/
│   ├── architecture-be/
│   ├── screen-list/
│   ├── screen-flow/
│   ├── api-error-handling/
│   ├── matrix-design/
│   ├── batch-overview/
│   └── external-interface-overview/
└── detail-design/
    ├── fields-validation-messages/
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

Detail Design — template trong [`detail-design/`](./detail-design/); link từ `.backlogs/{id}/design/{id}.md` mục **Artifacts**.

## Basic vs Detail

| Type | Khi nào | Vị trí |
|------|---------|--------|
| **Basic** | Scope đã chốt; trước code | `basic-design/` |
| **Detail** | Sẵn sàng implement | Link trong task hoặc `detail-design/` (dự án) |

## Required by task scope

| Task scope | Minimum design |
|------------|----------------|
| XS / S | `basic-design/` baseline + `{id}/design/{id}.md` (Artifacts có thể `skip`) |
| M | BD đủ + DD; file `{id}/design/` bắt buộc |
| L | Full BD + DD; Handoff đầy đủ trong `{id}/design/{id}.md` |

Skills: [design-workflow](../../.cursor/skills/design-workflow/SKILL.md) · [04_WORKFLOW_DESIGN.md](../../.workflow-sldc/04_WORKFLOW_DESIGN.md).

## Templates — Basic Design

Xem [basic-design/README.md](./basic-design/README.md).

## Templates — Detail Design

Xem [detail-design/README.md](./detail-design/README.md).

## Linking from backlog

File: `.backlogs/{id}/design/{id}.md` ([_design.template.md](../../.backlogs/_design.template.md))

```markdown
## Artifacts

| Layer | Doc | Action | Path |
|-------|-----|--------|------|
| BD | screen-list | update | .notebook/06_design/basic-design/screen-list/screen-list.md |
| DD | shipment-api | create | .notebook/06_design/detail-design/api-document/shipment-api.md |
```
