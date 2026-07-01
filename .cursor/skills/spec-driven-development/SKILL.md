---
name: spec-driven-development
description: Creates specs before coding using the notebook layout. Use when starting a project, feature, or significant change. Analyze against notebook catalogs (01–03), update them if needed, then hand off to planning-and-task-breakdown for backlogs tasks. Use when requirements need structure before implementation.
---

# Spec-Driven Development (notebook)

Write structured planning artifacts in [.notebook/](../../.notebook/) before any implementation. The notebook is the shared source of truth — not ad-hoc chat or intake files.

## When to Use

- New project, feature, or significant change
- Requirements ambiguous or incomplete
- Change may affect business scope, function catalog, or NFR
- Work would take more than ~30 minutes to implement

**When NOT to use:** Single-line fixes, typos, or one-off XS tasks with obvious scope — use [planning-and-task-breakdown](./planning-and-task-breakdown/SKILL.md) directly.

## Gated workflow

```
SPECIFY ──→ PLAN (catalogs) ──→ TASKS ──→ IMPLEMENT
   │              │                │            │
   ▼              ▼                ▼            ▼
 Human         Human         planning-and-   Develop
 review        review        task-breakdown  (later)
                               → backlogs
```

Do not advance until the human validates the current phase.

## Before you start

1. Read [.notebook/README.md](../../.notebook/README.md) and [.notebook/workflow.md](../../.notebook/workflow.md).
2. Check [00_references/invest.md](../../.notebook/00_references/invest.md) and [definition-of-done.md](../../.notebook/00_references/definition-of-done.md).
3. Do **not** persist raw intake in the repo.

---

## Phase 1 — SPECIFY (Analyze)

Cross-check the request against notebook catalogs:

| Source | Question |
|--------|----------|
| [01_business-requirements/](../../.notebook/01_business-requirements/) | In scope? Stakeholders? Success metrics? |
| [02_function-list/](../../.notebook/02_function-list/) | Existing Function/Task or new capability? |
| [03_non-functional-requirements/](../../.notebook/03_non-functional-requirements/) | Which NFRs apply or change? |

**Surface assumptions** before writing anything:

```
ASSUMPTIONS I'M MAKING:
1. …
2. …
→ Correct me now or I'll proceed with these.
```

**Reframe vague requests as testable success criteria:**

```
REQUEST: "Make the dashboard faster"

SUCCESS CRITERIA (draft):
- LCP < 2.5s on 4G
- Initial load < 500ms
→ Are these the right targets?
```

**Specify output (pick what applies):**

| Need | Action | Template |
|------|--------|----------|
| Scope / stakeholders change | Update `01_business-requirements/overview.md` | [overview.template.md](../../.notebook/01_business-requirements/overview.template.md) |
| New capability or catalog task | Update `02_function-list/catalog.md` | [catalog.template.md](../../.notebook/02_function-list/catalog.template.md) |
| New or changed NFR | Update `03_non-functional-requirements/` | [catalog.template.md](../../.notebook/03_non-functional-requirements/catalog.template.md) |
| One-off, no catalog change | Note in handoff only — go to Phase 3 | — |

Most requests only need **backlogs** tasks, not catalog changes.

**Human gate:** Stakeholder confirms scope, success criteria, and catalog updates (if any).

---

## Phase 2 — PLAN (Catalog alignment)

When catalogs change:

1. **02_function-list** — Function, Task name, Summary, Outcome; set **Backlog** to `TBD` until task folder exists.
2. **03_non-functional-requirements** — security, performance, compliance, etc.
3. **01_business-requirements** — only if scope IN/OUT or stakeholders change.

Identify at plan level (lightweight — detail lives in backlog tasks):

- Major components and dependencies
- Implementation order (foundation first)
- Risks and mitigations
- What can run in parallel vs sequential

For dependency graphs and vertical slicing mechanics, defer to [planning-and-task-breakdown](./planning-and-task-breakdown/SKILL.md).

**Human gate:** Catalog diffs reviewed; approach agreed.

---

## Phase 3 — TASKS (Handoff)

If no task exists yet, run **[analyze-intake-to-task](./analyze-intake-to-task/SKILL.md)** first (one `draft` task).

Then invoke **[planning-and-task-breakdown](./planning-and-task-breakdown/SKILL.md)** when hardening or splitting is needed.

It creates or updates:

- `backlogs/task-{id}/README.md` from [_task.template.md](../../backlogs/_task.template.md)
- `subtask-{id}_{slug}.md` when scope is L+
- **Backlog** links in `02_function-list` when applicable

Each task must satisfy **INVEST** and include: type, value, AC, estimation, test plan (outline).

**Human gate:** Tasks at status `ready` — see [workflow Step 5](../../.notebook/workflow.md).

---

## Phase 4 — IMPLEMENT

Out of scope for this skill. After `ready`:

- Fill Design / Implementation in task files
- Use `.agent/vendor/agent-skills/skills/incremental-implementation`, `test-driven-development` as needed
- Verification: `.agent/vendor/superpowers/skills/verification-before-completion`
- Delivery: `.cursor/skills/report-writer` → `.notebook/05_reports/`

---

## Keeping specs alive

- Decision or scope change → update notebook catalogs and affected backlog tasks **first**, then code.
- Link PRs / commits to `task-{id}` and catalog rows where applicable.

## Common rationalizations

| Rationalization | Reality |
|-----------------|---------|
| "Too simple for a spec" | XS still needs AC in a backlog task — use breakdown only. |
| "Spec after coding" | That's documentation, not specification. |
| "Requirements will change" | Notebook is a living spec — update it. |

## Red flags

- Code before `backlogs` task with AC exists
- Catalog and backlog contradict each other
- Skipping human gate at SPECIFY or TASKS

## Verification (before IMPLEMENT)

- [ ] Request analyzed against 01–03
- [ ] Assumptions surfaced and confirmed
- [ ] Catalog updates reviewed (if any)
- [ ] `backlogs` tasks created via planning-and-task-breakdown
- [ ] INVEST satisfied; status `ready` approved
