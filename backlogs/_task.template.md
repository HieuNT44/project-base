# {Task title}

**ID:** task-{id}  
**Type:** feature | bugfix | refactor | deploy  
**Function:** {link to function-list row or name — use `—` if not catalog work}  
**Status:** draft | ready | in-progress | done  
**Scope:** XS | S | M | L

## Description

What is completed when this task is done. State **what** and **why** — keep **how** negotiable until Design / Develop.

## Value

Who benefits and what they gain (user, business, or technical outcome).

## Intake analysis

_(From [analyze-intake-to-task](../../.cursor/skills/analyze-intake-to-task/SKILL.md) — update when scope changes.)_

| Check | Result |
|-------|--------|
| **In scope (01)?** | yes \| no \| unclear |
| **Maps to function-list (02)?** | row \| one-off \| new capability |
| **NFR (03)?** | … \| none |
| **Catalog update needed?** | yes \| no |
| **Escalate to breakdown?** | yes \| no |

## INVEST

See [INVEST checklist](../../.notebook/00_references/invest.md). Confirm before status = `ready`:

- [ ] **Independent** — minimal dependencies; none block start without reason
- [ ] **Negotiable** — outcome clear; implementation not over-specified here
- [ ] **Valuable** — value stated above
- [ ] **Estimable** — Estimation filled; unknowns listed
- [ ] **Small** — XS–M scope, or split into subtasks below
- [ ] **Testable** — AC + test plan are objectively verifiable

## Acceptance criteria

- [ ] …
- [ ] …

## Estimation

| Field | Value |
|-------|-------|
| **Scope** | XS \| S \| M \| L (L → split into subtasks) |
| **Files (est.)** | 1–2 \| 3–5 \| 5+ |
| **Risk** | low \| medium \| high |
| **Unknowns** | — \| list open questions |

## Test plan

| Field | Value |
|-------|-------|
| **TDD applies** | yes \| no (config-only, deploy-only) |
| **Test type** | unit \| integration \| e2e \| manual |
| **RED first** | Failing test or repro (required for **bugfix** when code; optional for **feature**) |
| **Commands** | e.g. `npm test -- …`, manual UAT, smoke steps |

**bugfix:** repro must **fail before** the fix (Prove-It).  
**refactor:** existing tests must stay green throughout.  
**deploy:** smoke checklist instead of TDD.

## Dependencies

- — | task-{otherId} | subtask-{id}_{slug}

## Files / artifacts

Paths likely created or modified (`backend/`, `frontend/`, `.notebook/06_design/`, …).

## External tracker

Optional: Redmine #… / Jira PROJ-… / link

## Subtasks

| Subtask | File | Status |
|---------|------|--------|
| {slug} | [subtask-{id}_{slug}.md](./subtask-{id}_{slug}.md) | draft |

## Reports

Link to [.notebook/05_reports](../../.notebook/05_reports/) when created. **Task delivery** required before PM/client handover when status = `done`.

| Type | File | Audience |
|------|------|----------|
| Delivery | [delivery-YYYY-MM-DD.md](../../.notebook/05_reports/task-{id}/delivery-….md) | PM / client |
| Progress | — | PM |
| Incident | — | PM / client |

---

## Design

_(**feature** / non-trivial: link artifacts in [.notebook/06_design](../../.notebook/06_design/). **bugfix** / **deploy**: skip if trivial.)_

| Artifact | Path |
|----------|------|
| Basic / Detail design | — |

## Implementation

_(Filled in Develop phase. **deploy**: use deploy runbook + rollback.)_

**Approach:** vertical slice \| incremental \| deploy  
**Skills:** see [.agent/vendor/README.md](../../.agent/vendor/README.md) — `incremental-implementation`, `test-driven-development`

### Steps

- [ ] Write failing test or repro (RED) — **bugfix** / **feature** with code
- [ ] Run — confirm fail (or confirm green baseline for **refactor**)
- [ ] Minimal implementation / change (GREEN)
- [ ] Run — confirm pass
- [ ] Refactor (if needed)
- [ ] Commit increment

## Review / doubt

_(Optional — non-trivial **feature**, unclear **bugfix** root cause, wide **refactor**, risky **deploy**.)_

| Field | Value |
|-------|-------|
| **CLAIM** | What must be true when this ships |
| **Why it matters** | Blast radius if wrong |
| **Review** | fresh review \| self-check \| — |

## UAT / Verification evidence

Required before status = `done`. No completion claims without fresh command output or recorded manual steps.

| Claim | Command / step | Result |
|-------|----------------|--------|
| Tests pass | `…` | exit 0 / paste output |
| Manual UAT / smoke | … | screenshot / note |
| … | … | … |

## Definition of done

Task acceptance criteria met + [project Definition of Done](../../.notebook/00_references/definition-of-done.md):

- [ ] INVEST checklist satisfied
- [ ] Verification evidence recorded above
- [ ] No regressions
- [ ] Human review (if required)
- [ ] [Task delivery report](../../.notebook/05_reports/task-{id}/) created (PM / client handover)
