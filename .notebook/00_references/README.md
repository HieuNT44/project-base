# References — standing gates & checklists

Single source of truth for project-wide gates and quick-reference checklists. Adapted from [agent-skills](https://github.com/addyosmani/agent-skills) where noted.

## Gates (Plan · Test)

| Doc | Purpose | When |
|-----|---------|------|
| [invest.md](./invest.md) | INVEST criteria for backlog tasks | Plan — before `ready` |
| [definition-of-done.md](./definition-of-done.md) | Standing bar every change clears | Test — before task `done` |

## Checklists (by skill)

| Doc | Companion skill | When |
|-----|-----------------|------|
| [testing-patterns.md](./testing-patterns.md) | `test-driven-development` | TDD · writing tests |
| [security-checklist.md](./security-checklist.md) | `security-and-hardening` | Review · pre-merge · auth/input work |
| [accessibility-checklist.md](./accessibility-checklist.md) | `frontend-ui-engineering` | UI · WCAG 2.1 AA |
| [performance-checklist.md](./performance-checklist.md) | `performance-optimization` | Perf audit · Core Web Vitals |
| [observability-checklist.md](./observability-checklist.md) | `observability-and-instrumentation` | Logs · metrics · traces · alerts |
| [orchestration-patterns.md](./orchestration-patterns.md) | — | Multi-persona review · `/ship` fan-out |

## Usage

- Skills and [00-workflow.mdc](../../.cursor/rules/00-workflow.mdc) link here — do not duplicate checklist content in task files.
- Load on demand during Review / Ship — not all at once (context limits).
