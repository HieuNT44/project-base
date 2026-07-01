# INVEST — backlog task quality

Every backlog task and subtask should satisfy **INVEST** (Independent, Negotiable, Valuable, Estimable, Small, Testable). Use this at **Plan** before setting status to `ready`.

## Principles

| Letter | Principle | What it means |
|--------|-----------|-----------------|
| **I** | **Independent** | As few dependencies on other tasks as possible. Can start or finish without waiting on unrelated work. |
| **N** | **Negotiable** | Describes the outcome clearly enough to discuss — not a rigid implementation prescription. Details belong in Design / Develop. |
| **V** | **Valuable** | Delivers clear value to users or the business. State who benefits and how. |
| **E** | **Estimable** | Effort can be sized (scope, files, risk). Unknowns are listed, not hidden. |
| **S** | **Small** | Completable in a focused session. Scope **L** → split into subtasks. |
| **T** | **Testable** | Acceptance criteria and test plan are objective — someone can verify pass/fail. |

## Checklist (Plan gate)

Before `ready`:

- [ ] **Independent** — dependencies listed; none block starting unless documented
- [ ] **Negotiable** — description states *what* and *why*, not locked-in *how*
- [ ] **Valuable** — value stated (user, business, or technical outcome)
- [ ] **Estimable** — Estimation section filled; unknowns explicit
- [ ] **Small** — scope XS–M, or split into subtasks
- [ ] **Testable** — acceptance criteria + test plan are verifiable

## Task types

Set **Type** on every task. Subtasks inherit the parent type unless noted.

| Type | When to use | Value focus | TDD | Key sections |
|------|-------------|-------------|-----|--------------|
| **feature** | New capability or catalog work | User/business outcome | yes when code; manual when Setup only | AC, Test plan, Design (if non-trivial) |
| **bugfix** | Fix known defect | Restored correct behavior | yes when code | RED first (Prove-It), AC, Verification evidence |
| **refactor** | Tech debt; behavior unchanged | Maintainability, risk reduction | yes — tests stay green | AC (no behavior change), Test plan, Review/doubt if wide |
| **deploy** | Release, promote, smoke | Safe delivery to target env | no | Deploy steps, rollback, smoke checklist |

### Section emphasis by type

| Section | feature | bugfix | refactor | deploy |
|---------|---------|--------|----------|--------|
| Design | often | skip if trivial | optional | — |
| Implementation / TDD | when code | Prove-It | refactor steps | deploy runbook |
| Review / doubt | non-trivial | if root cause unclear | if wide blast radius | rollback path |
| UAT / Verification evidence | required | required | required | required (smoke) |

## Red flags

- Cannot explain value in one sentence → not **Valuable** yet.
- Scope L with no subtasks → not **Small**.
- "Done when implemented" with no AC → not **Testable**.
- Hard-coded solution in Description → not **Negotiable**; move detail to Design.
- Long dependency chain → not **Independent**; reorder or split.
