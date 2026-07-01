# {Subtask title}

**ID:** subtask-{parentId}_{slug}  
**Parent:** [task-{parentId}](./README.md)  
**Type:** _(inherits parent: feature \| bugfix \| refactor \| deploy)_  
**Status:** draft | ready | in-progress | done  
**Scope:** XS | S | M

## Description

What this subtask completes within the parent task.

## Value

Slice of parent value this subtask delivers.

## INVEST

Subtask must satisfy [INVEST](../../.notebook/00_references/invest.md) within parent scope:

- [ ] **Independent** — can complete without unrelated subtasks
- [ ] **Negotiable** — outcome clear; not over-specified
- [ ] **Valuable** — contributes to parent value
- [ ] **Estimable** — scope XS–S preferred
- [ ] **Small** — one focused increment
- [ ] **Testable** — verifiable AC

## Acceptance criteria

- [ ] …

## Estimation

| Field | Value |
|-------|-------|
| **Scope** | XS \| S \| M |
| **Files (est.)** | 1–2 \| 3–5 |
| **Risk** | low \| medium \| high |

## Test plan

| Field | Value |
|-------|-------|
| **TDD applies** | yes \| no |
| **Test type** | unit \| integration \| e2e \| manual |
| **RED first** | — |
| **Commands** | — |

## Verification

How to confirm this subtask alone (commands or manual steps).

## Dependencies

- — | other subtask or task id

## Files / artifacts

-

## External tracker

Optional: Redmine #… / Jira PROJ-…

---

## Implementation

_(Filled in Develop phase.)_

- [ ] RED → GREEN → refactor (when TDD applies)
- [ ] Commit increment

## UAT / Verification evidence

| Claim | Command / step | Result |
|-------|----------------|--------|
| … | … | … |

## Definition of done

Subtask AC met + parent [Definition of Done](../../.notebook/00_references/definition-of-done.md) (Correctness + Quality minimum).
