---
name: analyze-intake-to-task
description: Analyzes raw intake (chat, ticket, notes) against notebook catalogs and creates one draft backlog task in backlogs/. Use after intent is clear enough to act, or when user pastes a rough request and wants a single task draft. Bridge between Define (interview-me, idea-refine) and Plan (spec-driven-development, planning-and-task-breakdown).
---

# Analyze Intake to Task

Turn **raw requirements** into **one draft task** in [backlogs/](../../backlogs/). Do not store intake as a separate file — only the task artifact.

## When to Use

- User provides rough text: ticket, chat, meeting notes, email
- Intent is clear enough to draft work (after [interview-me](./interview-me/SKILL.md) if needed)
- Goal is **one task** to review, not a full catalog spec yet
- Quick path before `ready` and Develop

**When NOT to use:**

- Intent still missing who/why/success → [interview-me](./interview-me/SKILL.md) first
- Multiple directions not converged → [idea-refine](./idea-refine/SKILL.md) first
- Scope L+ needing many subtasks → create draft here, then [planning-and-task-breakdown](./planning-and-task-breakdown/SKILL.md)
- New product capability needing catalog → flag + [spec-driven-development](./spec-driven-development/SKILL.md)

## Pipeline position

```
INTAKE (external)
    → interview-me? / idea-refine?
    → analyze-intake-to-task     ← this skill
    → spec-driven-development? / planning-and-task-breakdown?
    → Human: draft → ready
```

---

## Step 1 — Read context

1. [.notebook/README.md](../../.notebook/README.md) and [workflow.md](../../.notebook/workflow.md)
2. [01_business-requirements/](../../.notebook/01_business-requirements/) — scope IN/OUT
3. [02_function-list/](../../.notebook/02_function-list/) — existing Function/Task rows
4. [03_non-functional-requirements/](../../.notebook/03_non-functional-requirements/) — applicable NFRs
5. [INVEST](../../.notebook/00_references/invest.md) — quick pass for gaps

Do not write code. Read-only until task file is created.

---

## Step 2 — Analyze intake

Fill this table (include in the task under **Intake analysis**):

| Check | Result |
|-------|--------|
| **In scope (01)?** | yes \| no \| unclear — note |
| **Maps to function-list (02)?** | row / task name \| one-off \| new capability |
| **NFR (03)?** | list \| none |
| **Catalog update needed?** | yes → escalate spec-driven \| no |
| **Suggested type** | feature \| bugfix \| refactor \| deploy |
| **Escalate to breakdown?** | yes if scope L+ \| no |

**Decisions:**

| Situation | Action |
|-----------|--------|
| One-off, in scope | One task, no catalog change |
| Maps existing catalog row | Link **Function**; plan **Backlog** link after task id assigned |
| New capability | Create task draft + set **Catalog update needed: yes** — do not edit catalog in this skill |
| Out of scope | Stop; tell human — do not create task |

---

## Step 3 — Assign task id

Pick next free `task-{id}` (scan [backlogs/](../../backlogs/) folders). Use short slug in title.

Create:

```
backlogs/task-{id}/README.md
```

Copy structure from [_task.template.md](../../backlogs/_task.template.md).

**Status:** always `draft` when this skill finishes.

---

## Step 4 — Fill draft task (minimum)

| Section | Draft quality |
|---------|----------------|
| **Type** | From analysis |
| **Function** | Catalog link or `—` |
| **Description** | What + why (negotiable how) |
| **Value** | Who benefits |
| **Intake analysis** | Table from Step 2 |
| **INVEST** | Check what you can; leave gaps explicit |
| **Acceptance criteria** | 2–4 draft bullets |
| **Estimation** | Best guess scope/risk; list **Unknowns** |
| **Test plan** | TDD yes/no outline; commands TBD ok |
| **Dependencies** | — or noted |
| **External tracker** | Ticket link if intake from Redmine/Jira |

Leave **Design**, **Implementation**, **UAT**, **Reports** empty or “Not started.”

Do **not** set status `ready` — human reviews draft first.

---

## Step 5 — Next step recommendation

Add to task (bottom or Intake analysis):

```markdown
## Recommended next steps

- [ ] Human review draft
- [ ] … spec-driven-development (if catalog update needed)
- [ ] … planning-and-task-breakdown (if scope L or AC need hardening)
- [ ] … Set status ready when INVEST complete
```

---

## Anti-overlap

| Skill | This skill | Other |
|-------|------------|-------|
| Creates task file | ✓ one draft | interview/idea-refine do not |
| Updates 01–03 catalogs | ✗ flag only | spec-driven-development |
| Full INVEST + subtasks | partial | planning-and-task-breakdown |

---

## Red flags

- Creating intake.md or saving raw paste in repo
- Status `ready` without human review
- Editing catalog without spec-driven-development
- Multiple tasks without breakdown skill
- Skipping scope check against 01

## Verification

Before handing off:

- [ ] Exactly one `task-{id}/README.md` created
- [ ] Status is `draft`
- [ ] Intake analysis table present
- [ ] Recommended next steps listed
- [ ] Catalog impact flagged, not silently changed

## See also

- [interview-me](./interview-me/SKILL.md) — unclear intent
- [idea-refine](./idea-refine/SKILL.md) — refine options before task
- [spec-driven-development](./spec-driven-development/SKILL.md) — catalog updates
- [planning-and-task-breakdown](./planning-and-task-breakdown/SKILL.md) — split / harden to `ready`
