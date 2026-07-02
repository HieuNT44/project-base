# Cursor — project agent setup

Wires org skills and workflow into Cursor for any project cloned from **project-base**.

## Rules (auto-loaded)

| File | Scope |
|------|--------|
| [rules/00-workflow.mdc](./rules/00-workflow.mdc) | Always — full pipeline + skill routing |
| [rules/01-backlog-tasks.mdc](./rules/01-backlog-tasks.mdc) | When editing `.backlogs/**` |
| [rules/02-design-docs.mdc](./rules/02-design-docs.mdc) | When editing `.notebook/06_design/**` |

## Skills (source of truth)

Edit skills only under [skills/](./skills/). See [skills/README.md](./skills/README.md).

| Phase | Skills |
|-------|--------|
| Define | `interview-me`, `idea-refine`, `create-task-draft` |
| Plan | `spec-driven-development`, `planning-and-task-breakdown` |
| Design | `design-workflow` |
| Report | `report-writer` |

## Usage in chat

- **Auto:** Agent picks skill from `description` when context matches
- **Explicit:** `@design-workflow` or “Use skill design-workflow for …”
- **Entry:** [WORKFLOW.md](../WORKFLOW.md) → [.workflow-sldc/01_WORKFLOW.md](../.workflow-sldc/01_WORKFLOW.md)

## Maintenance

New skill: add `.cursor/skills/{name}/SKILL.md`, register in `skills/README.md` and `rules/00-workflow.mdc`.
