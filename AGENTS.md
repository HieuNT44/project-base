# AGENTS.md

Guidance for AI coding agents (Cursor, Claude Code, Copilot, etc.) in repositories based on **project-base**.

## Read first

1. [.notebook/README.md](.notebook/README.md) — folder layout
2. [.notebook/workflow.md](.notebook/workflow.md) — full pipeline
3. [.cursor/skills/README.md](.cursor/skills/README.md) — project skills

## Pipeline

```
INTAKE (external — not stored)
  → Define (.cursor/skills: interview-me | idea-refine | analyze-intake-to-task)
  → Plan (spec-driven-development | planning-and-task-breakdown)
  → Human: draft → ready
  → Design (basic-design | detail-design) → .notebook/06_design/
  → Develop (backend/ | frontend/ | infra/)
  → Test (test/ + backlog verification evidence)
  → Report (report-writer → .notebook/05_reports/)
```

## Hard rules

- Do not store raw intake in the repo.
- Do not set backlog status `ready` without INVEST + human approval.
- Do not implement M+ work without design links in task **Design** section.
- Skills source of truth: `.cursor/skills/` only.
- Develop-phase vendor skills: see [.agent/vendor/README.md](.agent/vendor/README.md).

## Intent → skill

| Situation | Skill |
|-----------|-------|
| Unclear intent | `interview-me` |
| Many options / MVP | `idea-refine` |
| Raw intake → draft task | `analyze-intake-to-task` |
| Catalog impact | `spec-driven-development` |
| Split / harden tasks | `planning-and-task-breakdown` |
| Basic design | `basic-design` |
| Detail design | `detail-design` |
| Task done → report | `report-writer` |

## Code layout (placeholders — define per project)

| Folder | Purpose |
|--------|---------|
| `backend/` | API, services |
| `frontend/` | UI |
| `infra/` | IaC, deploy |
| `test/` | Automated tests |
| `script/` | Repo scripts |
| `backlogs/` | Executable task specs |

## Cursor

Rules and skills: [.cursor/README.md](.cursor/README.md)
