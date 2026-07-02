# Skills

Org-wide agent skills by workflow phase. **Single source of truth** — edit here only.

## Pipeline skills

| Phase | Skills |
|-------|--------|
| Define | [interview-me](./interview-me/SKILL.md), [idea-refine](./idea-refine/SKILL.md), [create-task-draft](./create-task-draft/SKILL.md) |
| Plan | [spec-driven-development](./spec-driven-development/SKILL.md), [planning-and-task-breakdown](./planning-and-task-breakdown/SKILL.md) |
| Design | [design-workflow](./design-workflow/SKILL.md) |
| Report | [report-writer](./report-writer/SKILL.md) |

## Develop & quality

| Situation | Skill |
|-----------|-------|
| Implement step-by-step | [incremental-implementation](./incremental-implementation/SKILL.md) |
| TDD / bug repro | [test-driven-development](./test-driven-development/SKILL.md) |
| Debug / triage | [debugging-and-error-recovery](./debugging-and-error-recovery/SKILL.md) |
| Pre-merge review | [code-review-and-quality](./code-review-and-quality/SKILL.md) |
| Simplify diff | [code-simplification](./code-simplification/SKILL.md) |
| FE / UI work | [frontend-ui-engineering](./frontend-ui-engineering/SKILL.md) |
| API / contract design | [api-and-interface-design](./api-and-interface-design/SKILL.md) |
| Browser verify | [browser-testing-with-devtools](./browser-testing-with-devtools/SKILL.md) |
| Performance | [performance-optimization](./performance-optimization/SKILL.md) |
| Security | [security-and-hardening](./security-and-hardening/SKILL.md) |
| Observability | [observability-and-instrumentation](./observability-and-instrumentation/SKILL.md) |
| CI/CD | [ci-cd-and-automation](./ci-cd-and-automation/SKILL.md) |
| Git / release | [git-workflow-and-versioning](./git-workflow-and-versioning/SKILL.md) |
| Ship / launch | [shipping-and-launch](./shipping-and-launch/SKILL.md) |
| Deprecation | [deprecation-and-migration](./deprecation-and-migration/SKILL.md) |
| ADRs / docs | [documentation-and-adrs](./documentation-and-adrs/SKILL.md) |

## Meta & stress-test

| Situation | Skill |
|-----------|-------|
| Stress-test a plan | [doubt-driven-development](./doubt-driven-development/SKILL.md) |
| Source-first workflow | [source-driven-development](./source-driven-development/SKILL.md) |
| Context / prompts | [context-engineering](./context-engineering/SKILL.md) |
| Using skills | [using-agent-skills](./using-agent-skills/SKILL.md) |

## Full pipeline

```
INTAKE → define → plan → ready → design → develop → review → test → deploy → report
```

See [.notebook/README.md](../../.notebook/README.md) · [.workflow-sldc/01_WORKFLOW.md](../../.workflow-sldc/01_WORKFLOW.md)

## Handoff

| After | Use |
|-------|-----|
| Draft task | `planning-and-task-breakdown` → `ready` |
| `ready` | `design-workflow` → `design/{id}.md` |
| Design done | `incremental-implementation` · `test-driven-development` → Develop |
| Develop complete | `code-review-and-quality` → test → deploy |
| `done` | `report-writer` |
