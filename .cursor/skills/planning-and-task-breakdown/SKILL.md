---
name: planning-and-task-breakdown
description: Breaks work into ordered notebook backlog tasks. Use when you have requirements or a spec and need implementable tasks in backlogs/. Use when a task feels too large, you need estimation, INVEST sizing, or clear dependency order. Output uses _task.template.md and _subtask.template.md.
---

# Planning and Task Breakdown (notebook)

Decompose work into small, verifiable tasks under [backlogs/](../../backlogs/). Every task must satisfy [INVEST](../../.notebook/00_references/invest.md) before status = `ready`.

Adapted from [.agent/vendor/agent-skills/skills/planning-and-task-breakdown](../../.agent/vendor/.agent/vendor/agent-skills/skills/planning-and-task-breakdown/SKILL.md).

## When to Use

- Requirements or spec exist; need backlog tasks
- Task feels too large or vague
- Parallel work or multi-session delivery
- Implementation order is not obvious

**When NOT to use:** Single-file XS change with obvious scope and existing backlog task.

## When to Use With spec-driven-development

| Situation | Flow |
|-----------|------|
| New feature / catalog impact | [spec-driven-development](./spec-driven-development/SKILL.md) → this skill |
| One-off bugfix / small change | This skill only |

---

## Step 1 — Enter plan mode (read-only)

- Read [.notebook/workflow.md](../../.notebook/workflow.md) and relevant catalogs (01–03)
- Read codebase sections that will be touched
- Identify patterns and conventions
- Map dependencies and risks

**Do not write implementation code.** Output is backlog markdown only.

---

## Step 2 — Dependency graph

Map what depends on what. Implementation order is **bottom-up** on the graph.

```
Foundation A
    ├── Slice 1 (A + B + C minimal path)
    ├── Slice 2
    └── Slice 3
```

---

## Step 3 — Slice vertically

Prefer **vertical slices** (one complete path per task), not horizontal layers.

**Bad:** all schema → all API → all UI  
**Good:** registration works end-to-end → login works → list view works

Each slice leaves the system in a working, testable state.

---

## Step 4 — Write backlog tasks

### Location

| Artifact | Path |
|----------|------|
| Parent task | `backlogs/task-{id}/README.md` |
| Subtask | `backlogs/task-{id}/subtask-{id}_{slug}.md` |
| Single task (no subtasks) | `backlogs/task-{id}.md` optional |

Copy from:

- [_task.template.md](../../backlogs/_task.template.md)
- [_subtask.template.md](../../backlogs/_subtask.template.md)

### Required fields (Plan phase)

Fill through **Test plan** and **Dependencies** before `ready`:

| Field | Notes |
|-------|-------|
| **Type** | `feature` \| `bugfix` \| `refactor` \| `deploy` |
| **Value** | Who benefits |
| **INVEST** | All six checked |
| **Acceptance criteria** | Testable |
| **Estimation** | Scope XS–L; L → split subtasks |
| **Test plan** | TDD yes/no, test type, commands outline |

Design / Implementation / UAT sections — fill in later phases.

### Link function-list

If task maps to [02_function-list](../../.notebook/02_function-list/):

- Set **Backlog** column to `[task-{id}](../../backlogs/task-{id}/)`

---

## Step 5 — Task sizing

| Scope | Files (est.) | Action |
|-------|--------------|--------|
| **XS–S** | 1–2 | Single task |
| **M** | 3–5 | Single task or 2 subtasks |
| **L** | 5+ | **Split into subtasks** |
| **XL** | 8+ | Must decompose — never one task |

Break down further when:

- More than one focused session (~2h+ agent work)
- AC needs more than ~3 bullets
- Title contains "and" (likely two tasks)
- Touches independent subsystems

---

## Step 6 — Order and checkpoints

1. Dependencies satisfied (foundation first)
2. Each increment leaves system working
3. Checkpoint every 2–3 tasks for human review
4. High-risk tasks early (fail fast)

Example checkpoint in task README or subtask list:

```markdown
## Checkpoint (after subtasks 1–2)
- [ ] AC for slice 1 met
- [ ] Verification evidence recorded
- [ ] Human review before next slice
```

---

## Parallelization

| Safe parallel | Must be sequential |
|---------------|-------------------|
| Independent vertical slices | Shared migrations / schema |
| Docs for done slices | Same module conflicting edits |
| Tests for merged code | Contract undefined between slices |

Define shared contracts in parent task **Design** before parallel subtasks.

---

## Plan summary (optional)

For large efforts, add a short plan block at top of `task-{id}/README.md`:

```markdown
## Plan summary

**Architecture decisions:**
- …

**Task order:** subtask-a → subtask-b → subtask-c

**Risks:**
| Risk | Mitigation |
|------|------------|
| … | … |
```

Prefer backlog task files as source of truth — avoid duplicate `tasks/plan.md` unless the project already uses that convention.

---

## Common rationalizations

| Rationalization | Reality |
|-----------------|---------|
| "I'll figure it out as I go" | Written tasks surface hidden dependencies. |
| "Tasks are obvious" | Write them — INVEST catches gaps. |
| "Planning is overhead" | `backlogs/` **is** the plan. |

## Red flags

- No acceptance criteria
- No test plan / verification outline
- Scope L with no subtasks
- Missing INVEST checklist
- Status `ready` without human approval

## Verification (before Develop)

- [ ] Every task/subtask uses notebook templates
- [ ] INVEST satisfied ([invest.md](../../.notebook/00_references/invest.md))
- [ ] Dependencies ordered; vertical slices preferred
- [ ] Function-list **Backlog** links updated (if applicable)
- [ ] Human approved status `ready`
- [ ] Standing [Definition of Done](../../.notebook/00_references/definition-of-done.md) understood for Testing phase

## See also

- [spec-driven-development](./spec-driven-development/SKILL.md) — upstream catalog analysis
- [backlogs/README.md](../../backlogs/README.md) — task lifecycle and types
