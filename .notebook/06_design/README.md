# Design

Basic Design (BD) and Detail Design (DD) artifacts. Tech-agnostic — adapt labels (screen, object, API) to your stack.

## Structure

```
06_design/
├── 00_project/           # Basic — once per project / phase
├── 01_functions/{slug}/  # Basic — per function / feature area
├── 02_screens/{id}/      # Detail — per screen / page
├── 03_objects/{name}/    # Detail — data model per entity
├── 04_integrations/{name}/
├── 05_batches/{job}/
└── 06_logic/{slug}/
```

## Basic vs Detail

| Type | When | Examples |
|------|------|----------|
| **Basic** | Scope agreed; before implementation detail | System overview, architecture, business flow, screen list, ERD overview |
| **Detail** | Ready to implement | Layout, fields, validation, logic, API contract, batch spec |

## Required by task scope

| Task scope | Minimum design |
|------------|----------------|
| XS / S | Project baseline + inline in task **Design** section |
| M | Function-level Basic + targeted Detail files |
| L | Full Basic set + Detail per screen/object/integration |

Skills: [basic-design](../../.cursor/skills/basic-design/SKILL.md), [detail-design](../../.cursor/skills/detail-design/SKILL.md).

## Templates (`00_project/`)

Copy `_*.template.md` files to named docs (drop leading `_`).

| Template | Document |
|----------|----------|
| `_system-overview.template.md` | System Overview |
| `_architecture-frontend.template.md` | Architecture Design (Frontend) |
| `_architecture-backend.template.md` | Architecture Design (Backend) |
| `_permission-design.template.md` | Permission Design |
| `_integration-overview.template.md` | External Interface Overview |
| `_batch-overview.template.md` | Batch Overview |
| `_error-handling-overview.template.md` | Error Handling Overview |
| `_design-tokens.template.md` | Design Tokens (optional) |

## Templates (other folders)

| Folder | Template | Document |
|--------|----------|----------|
| `01_functions/` | `_business-flow.template.md` | Business Flow, Data Flow, Screen List, Screen Transition, ERD |
| `02_screens/` | `_layout.template.md` | Screen Layout, Events, Messages |
| `03_objects/` | `_table-definition.template.md` | Table Definition, Data Dictionary |
| `04_integrations/` | `_interface-spec.template.md` | Interface Specification, API Document |
| `05_batches/` | `_batch-design.template.md` | Batch Design |
| `06_logic/` | `_logic-design.template.md` | Logic Design, Sequence Diagram, Class Design |

## Linking from backlog

In `backlogs/task-{id}/README.md` **Design** section:

```markdown
| Artifact | Path |
|----------|------|
| Business flow | [business-flow.md](../../.notebook/06_design/01_functions/account-mgmt/business-flow.md) |
| Screen layout | [layout.md](../../.notebook/06_design/02_screens/account-detail/layout.md) |
```
