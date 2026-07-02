---
name: create-task-draft
description: Creates one draft backlog task in .backlogs/ from clarified requirements. Use after intent is clear (optional interview-me or idea-refine upstream), or when user wants a task draft packaged for Plan. Bridge between Define and Plan (spec-driven-development, planning-and-task-breakdown).
---

# Create Task Draft

Package clarified requirements into **one draft task** in [.backlogs/](../../.backlogs/). See [02_WORKFLOW_DEFINE.md](../../.workflow-sldc/02_WORKFLOW_DEFINE.md) and template [_task.template.md](../../.backlogs/_task.template.md).

Do not store intake as a separate file — only the task artifact.

## When to Use

- Requirements are clear enough to write a task (after [interview-me](./interview-me/SKILL.md) if needed)
- User wants a **draft** task file for human review before Plan
- Define step 7 — đóng gói task draft

**When NOT to use:**

- Intent still missing who/why/success → [interview-me](./interview-me/SKILL.md) first
- Multiple directions not converged → [idea-refine](./idea-refine/SKILL.md) first
- Set status `ready`, Todo, TTD chốt → [planning-and-task-breakdown](./planning-and-task-breakdown/SKILL.md)
- Edit notebook `01`–`03` → [spec-driven-development](./spec-driven-development/SKILL.md)

## Pipeline position

```
INTAKE (external)
    → interview-me? / idea-refine?
    → create-task-draft          ← this skill
    → spec-driven-development? / planning-and-task-breakdown?
    → Human: draft → ready
```

---

## Step 1 — Read context

1. [02_WORKFLOW_DEFINE.md](../../.workflow-sldc/02_WORKFLOW_DEFINE.md) and [01_WORKFLOW.md](../../.workflow-sldc/01_WORKFLOW.md)
2. [01_business-requirements/](../../.notebook/01_business-requirements/) — scope IN/OUT
3. [02_function-list/](../../.notebook/02_function-list/) — Function/Task rows
4. [03_non-functional-requirements/](../../.notebook/03_non-functional-requirements/) — NFRs

Do not write code. Read-only until task file is created.

---

## Step 2 — Notebook check (internal)

Use while filling §8 References and **Plan — Todo** line `Notebook:` (Plan may finalize):

| Check | Result |
|-------|--------|
| **In scope (01)?** | yes \| no \| unclear |
| **Maps to function-list (02)?** | row \| one-off \| new capability |
| **NFR (03)?** | list \| none |
| **Notebook update needed?** | yes → flag for spec-driven \| no |
| **Suggested type** | feature \| bugfix \| refactor \| deploy |
| **Estimate > 8h?** | yes → flag for Plan split \| no |

| Situation | Action |
|-----------|--------|
| One-off, in scope | One task, no notebook change |
| Maps existing row | Set **Function** in metadata |
| New capability | Draft task + flag notebook update — do not edit notebook here |
| Out of scope | Stop; tell human — do not create task |

---

## Step 3 — Assign task id

Pick next free `{id}` (e.g. `DEV_001`) — scan `.backlogs/*/draft/`; skip `example_001` unless updating the sample.

Create `.backlogs/{id}/draft/` and `{id}.md` from [_task.template.md](../../.backlogs/_task.template.md).

**Status:** always `draft`.

---

## Step 4 — Fill draft (Define minimum)

Fill sections **1–4** and **8**; **7** if NFR applies. Leave **5–6** empty or minimal; leave **Plan — Todo** and **Subtasks** empty.

| Mục template | Define content |
|--------------|----------------|
| Metadata | Title, Type, Status `draft`, Function if known |
| §1 User Story | As a / I want / So that |
| §2 Mô tả & Nhiệm vụ | What done looks like; UI/data/API hints |
| §3 Luồng | Happy path (**bugfix**: repro steps) |
| §4 AC | Given–When–Then (edge cases welcome) |
| §7 NFR | Only if `03` applies |
| §8 References | Scope, function-list, NFR, ticket, Figma/API |

Do **not** set status `ready`. Do **not** fill Plan — Todo (Plan phase).

---

## Step 5 — Recommended next steps

```markdown
## Recommended next steps

- [ ] Human review draft
- [ ] spec-driven-development (if notebook update needed)
- [ ] planning-and-task-breakdown (→ ready)
```

---

## Anti-overlap

| Skill | This skill | Other |
|-------|------------|-------|
| Creates draft task file | ✓ one draft | interview-me / idea-refine do not |
| Updates notebook | ✗ flag only | spec-driven-development |
| Todo, TTD, ready, subtasks | ✗ | planning-and-task-breakdown |

## Verification

- [ ] One `{id}/draft/{id}.md`, status `draft`
- [ ] §1–§4 and §8 present
- [ ] Notebook impact flagged, not silently changed

## See also

- [02_WORKFLOW_DEFINE.md](../../.workflow-sldc/02_WORKFLOW_DEFINE.md) · [03_WORKFLOW_PLAN.md](../../.workflow-sldc/03_WORKFLOW_PLAN.md)
- [interview-me](./interview-me/SKILL.md) · [idea-refine](./idea-refine/SKILL.md)
- [spec-driven-development](./spec-driven-development/SKILL.md) · [planning-and-task-breakdown](./planning-and-task-breakdown/SKILL.md)
