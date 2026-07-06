# Build — implement slice

Invoke **`incremental-implementation`** with **`test-driven-development`**.

## Default: one Todo item

1. Read `ready/{id}.md` Todo and `design/{id}.md` handoff
2. Make failing tests pass (GREEN) — minimum code
3. Run full test suite + build
4. Tick Todo on `ready/{id}.md`
5. Commit atomically; stop after one slice

## Autonomous (`/build auto`)

Only when user passes `auto` or `all`:

1. Require `ready/{id}.md` with Todo list — not `SPEC.md`
2. Confirm clean `git status` or ask user
3. Present full Todo plan — wait for explicit approval
4. Execute each Todo: RED → GREEN → regression → commit → tick
5. Stop on ambiguity, failing tests, or irreversible risk — use `doubt-driven-development`

Read [.workflow-sldc/01_WORKFLOW.md](../../.workflow-sldc/01_WORKFLOW.md).
