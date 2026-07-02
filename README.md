# project-base

Org-wide template for agent-driven projects: workflow, skills, rules, and design docs before code.

## Start here

- [WORKFLOW.md](./WORKFLOW.md) — entry pipeline
- [.workflow-sldc/](./.workflow-sldc/README.md) — [01](./.workflow-sldc/01_WORKFLOW.md) · [02 Define](./.workflow-sldc/02_WORKFLOW_DEFINE.md) · [03 Plan](./.workflow-sldc/03_WORKFLOW_PLAN.md) · [04 Design](./.workflow-sldc/04_WORKFLOW_DESIGN.md)
- [.notebook/README.md](./.notebook/README.md) — notebook layout
- [.cursor/README.md](./.cursor/README.md) — Cursor rules & skills
- [.backlogs/README.md](./.backlogs/README.md) — executable tasks

## Pipeline

```
INTAKE → define → plan → ready → design → develop → review → test → deploy → report
```

## Code folders (placeholders)

| Folder | Purpose |
|--------|---------|
| [backend/](./backend/) | API / services |
| [frontend/](./frontend/) | UI |
| [infra/](./infra/) | Deploy / IaC |
| [test/](./test/) | Automated tests |
| [script/](./script/) | Repo scripts |

## New project from this template

1. Copy or clone this repo
2. Fill `.notebook/01_business-requirements/`, `02_function-list/`
3. Remove `.backlogs/example_001/` when adding real work
4. Define stack in `.notebook/06_design/basic-design/`
5. Optionally add vendor skills per [.agent/vendor/README.md](./.agent/vendor/README.md)
