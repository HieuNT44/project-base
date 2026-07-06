# AGENTS.md

Hướng dẫn cho AI coding agents (Cursor, Claude Code, Copilot, …) khi làm việc trong repo **project-base**.

## Tổng quan

- **Git = spec** — notebook `.notebook/`, backlog `.backlogs/`, design `06_design/`
- **Ticket** (Redmine/Jira) = tracking — link trong task §0, §8
- **Intake thô** không lưu repo

Entry: [WORKFLOW.md](./WORKFLOW.md) → [.workflow-sldc/](./.workflow-sldc/README.md)

## Ba lớp vận hành

| Lớp | Vị trí | Vai trò |
|-----|--------|---------|
| **Skill** | `.cursor/skills/{name}/SKILL.md` | Workflow — *how* |
| **Persona** | `.cursor/agents/{name}.md` | Góc nhìn chuyên gia — *who* |
| **Command** | `.cursor/commands/{name}.md` | Entry `/name` — *when* |

**Quy tắc:** Persona không gọi persona khác. User hoặc slash command là orchestrator. Chi tiết: [.notebook/00_references/orchestration-patterns.md](./.notebook/00_references/orchestration-patterns.md)

## Intent → Skill

| Tình huống | Skill |
|------------|-------|
| Chưa rõ ý định | `interview-me` |
| Nhiều hướng / MVP | `idea-refine` |
| Đóng gói task nháp | `create-task-draft` |
| Cập nhật catalog 01–03 | `spec-driven-development` |
| Chốt `ready` | `planning-and-task-breakdown` |
| Thiết kế trước code | `design-workflow` |
| Test RED sau design | `test-driven-development` |
| Implement | `incremental-implementation` |
| Bug / lỗi bất ngờ | `debugging-and-error-recovery` |
| Review trước merge | `code-review-and-quality` |
| Đơn giản hóa code | `code-simplification` |
| API / contract | `api-and-interface-design` |
| UI | `frontend-ui-engineering` |
| Task `done` | `report-writer` |

Bảng đầy đủ: [.cursor/skills/README.md](./.cursor/skills/README.md) · meta: `using-agent-skills`

## Lifecycle (implicit)

Không bắt buộc slash command — agent map theo phase:

```
INTAKE → define → plan → ready → design → tdd → develop → review → test → deploy → report
```

| Phase | Command gợi ý | Artifact |
|-------|---------------|----------|
| Define | `/define` | `.backlogs/{id}/draft/` |
| Spec | `/spec` | notebook `01`–`03` |
| Plan | `/plan` | `.backlogs/{id}/ready/` |
| Design | `/design` | `design/` + `06_design/` |
| TDD | `/tdd` | `test/` RED |
| Develop | `/build` | `backend/` · `frontend/` |
| Test | `/test` | tick §5–§6 |
| Review | `/review` | PR |
| Ship | `/ship` | go/no-go |
| Report | `/report` | `05_reports/` |

## Execution model

1. Có ≥1% khả năng skill áp dụng → đọc và follow skill đó
2. Không code M+ khi chưa có `design/{id}.md`
3. Không set `ready` khi chưa INVEST + PM duyệt
4. Verify bằng evidence — không "seems right"

## Anti-rationalization

Bỏ qua các suy nghĩ sau:

- "Task nhỏ, không cần skill"
- "Implement nhanh trước, spec sau"
- "Gather context trước rồi mới skill"

## Personas

| Persona | Khi |
|---------|-----|
| `code-reviewer` | Review PR — `/review` |
| `security-auditor` | Audit bảo mật — `/ship` |
| `test-engineer` | Coverage / Prove-It — `/test`, `/ship` |
| `web-performance-auditor` | CWV audit — `/webperf` |

`/ship` = fan-out 3 persona song song → merge go/no-go. Xem [.cursor/agents/README.md](./.cursor/agents/README.md)

## Gates

- Plan: [INVEST](./.notebook/00_references/invest.md)
- Done: [Definition of Done](./.notebook/00_references/definition-of-done.md)
- Checklists: [.notebook/00_references/README.md](./.notebook/00_references/README.md)

## Hooks

Session start injects `using-agent-skills`: [.cursor/hooks.json](./.cursor/hooks.json)
