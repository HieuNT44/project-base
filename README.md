# project-base

Org-wide template for agent-driven projects: workflow, skills, rules, and design docs before code.

## Start here

- [AGENTS.md](./AGENTS.md) — agent entry point
- [.notebook/README.md](./.notebook/README.md) — planning & design layout
- [.cursor/README.md](./.cursor/README.md) — Cursor rules & skills
- [backlogs/README.md](./backlogs/README.md) — executable tasks

## Pipeline

```
INTAKE → define → plan → ready → design → develop → test → report
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
3. Remove `backlogs/task-example/` when adding real work
4. Define stack in `.notebook/06_design/00_project/`
5. Optionally add vendor skills per [.agent/vendor/README.md](./.agent/vendor/README.md)
