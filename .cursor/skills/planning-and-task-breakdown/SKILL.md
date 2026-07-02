---
name: planning-and-task-breakdown
description: Breaks work into ordered notebook backlog tasks. Use when you have requirements or a spec and need implementable tasks in .backlogs/. Use when a task feels too large, you need estimation, INVEST sizing, or clear dependency order. Output uses _task.template.md and _subtask.template.md.
---

# Planning and Task Breakdown (notebook)

Decompose work into small, verifiable tasks under [.backlogs/](../../.backlogs/). Every task must satisfy [INVEST](../../.notebook/00_references/invest.md) before status = `ready`.

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

- Read [01_WORKFLOW.md](../../.workflow-sldc/01_WORKFLOW.md) and relevant catalogs (01–03)
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
| Parent task | `.backlogs/{id}/ready/{id}.md` |
| Subtask | `.backlogs/{id}/ready/{id}_{slug}.md` |
| Draft (trước Plan) | `.backlogs/{id}/draft/{id}.md` |

Copy from:

- [_task.template.md](../../.backlogs/_task.template.md)
- [_subtask.template.md](../../.backlogs/_subtask.template.md)

### Required fields (Plan phase)

Before `ready`, complete on the **same 8-section skeleton** ([_task.template.md](../../.backlogs/_task.template.md)):

| Field | Section | Notes |
|-------|---------|-------|
| **Estimate** | Metadata | ≤ **8h** per task; split subtasks if over |
| **Assignee** | Metadata | Who owns execution |
| **Mô tả & Nhiệm vụ** | §2 | Clearer bullets than draft |
| **Luồng** | §3 | Edge cases; bugfix repro |
| **AC** | §4 | Testable G/W/T |
| **Tiêu chí hoàn thành** | §5 | Short checklist |
| **TTD** | §6 | Test cases mapped to AC |
| **References** | §8 | Enough to start work |
| **Plan — Todo** | Below §8 | h, order, assignee, dependencies |
| **Subtasks** | If > 8h | Each ≤ 8h, same template |

Use [INVEST](../../.notebook/00_references/invest.md) as internal Plan gate — no separate INVEST section on the task file.

Design output: `.backlogs/{id}/design/{id}.md` ([_design.template.md](../../.backlogs/_design.template.md)) — skill `design-workflow`.

Plan: copy/sinh từ `{id}/draft/{id}.md` → `{id}/ready/{id}.md` (giữ subtasks cùng folder).

### Link function-list

If task maps to [02_function-list](../../.notebook/02_function-list/):

- Set **Backlog** column to `[{id}](../../.backlogs/{id}/ready/{id}.md)`

---

## Step 5 — Task sizing

| Estimate | Action |
|----------|--------|
| **≤ 8h** | Single task — fill **Plan — Todo** |
| **> 8h** | **Split into subtasks** — each ≤ 8h |

Break down further when:

- More than one focused session (~8h+)
- AC needs many independent slices
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

Define shared contracts in parent **design** file before parallel subtasks.

---

## Plan summary (optional)

For large efforts, add a short plan block at top of `{id}/ready/{id}.md`:

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
| "Planning is overhead" | `.backlogs/` **is** the plan. |

## Red flags

- No acceptance criteria
- No test plan / verification outline
- Scope L with no subtasks
- Missing §6 TTD or §4 AC
- Status `ready` without human approval

## Verification (before Develop)

- [ ] Every task/subtask uses [_task.template.md](../../.backlogs/_task.template.md) / [_subtask.template.md](../../.backlogs/_subtask.template.md)
- [ ] §4 AC + §6 TTD testable; §5 checklist present
- [ ] **Plan — Todo** filled; estimate ≤ 8h or subtasks split
- [ ] [INVEST](../../.notebook/00_references/invest.md) satisfied (internal gate)
- [ ] Function-list **Backlog** links updated (if applicable)
- [ ] Human approved status `ready`

## See also

- [spec-driven-development](./spec-driven-development/SKILL.md) — upstream catalog analysis
- [.backlogs/README.md](../../.backlogs/README.md) — task lifecycle and types
