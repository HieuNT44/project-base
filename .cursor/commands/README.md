# Commands — slash entry points

Type `/` in Cursor chat to run. Each command activates the matching skills and/or personas.

## SLDC pipeline

| Command | Phase | Skills / persona |
|---------|-------|------------------|
| `/define` | Intake → draft | `interview-me` · `idea-refine` · `create-task-draft` |
| `/spec` | Catalog | `spec-driven-development` |
| `/plan` | ready | `planning-and-task-breakdown` |
| `/design` | design | `design-workflow` |
| `/tdd` | RED tests | `test-driven-development` |
| `/build` | GREEN code | `incremental-implementation` · `test-driven-development` |
| `/test` | Verify | `test-driven-development` · `browser-testing-with-devtools` |
| `/review` | PR gate | `code-review-and-quality` · persona `code-reviewer` |
| `/ship` | Pre-launch | `shipping-and-launch` · fan-out 3 personas |
| `/report` | Handover | `report-writer` |

## Quality

| Command | Use |
|---------|-----|
| `/webperf` | Web perf audit — persona `web-performance-auditor` |
| `/code-simplify` | Simplify while preserving behavior |

## Typical sequence

```
/define → /spec → /plan → /design → /tdd → /build → /test → /review → /ship → /report
```

Not every task needs every step. Bugfix: `/tdd` → `/build` → `/test` → `/review`.

See [WORKFLOW.md](../../WORKFLOW.md) · [AGENTS.md](../../AGENTS.md)
