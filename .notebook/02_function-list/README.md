# Function list

**Functional catalog** — what the system can do. Stable reference for analyzing incoming requests.

Execution detail lives in [../backlogs/](../backlogs/). This table links catalog tasks to backlog folders via the **Backlog** column.

## Files

| File | Purpose |
|------|---------|
| [catalog.template.md](./catalog.template.md) | Copy to `catalog.md` — master table |

## Columns

| Column | Required | Description |
|--------|----------|-------------|
| **Function** | Yes | Capability group (first row per group) |
| **Task** | Yes | Short task name — plain text, not a URL |
| **Backlog** | Yes | Link to `../backlogs/task-{id}/` or `TBD` |
| **Summary** | Yes | Brief what this task delivers |
| **Outcome** | Yes* | Business value (*on Function row; optional on child rows) |

### Optional columns (large projects)

| Column | When to add |
|--------|-------------|
| **ID** | `FN-01` / `T-01` for traceability with external trackers |
| **Module** | Multiple product areas in one catalog |
| **Priority** | P1/P2 for standard catalog rollout order |
| **Status** | `planned` / `delivered` for catalog maturity |

## When to update

- New module or capability added to the product
- Standard task decomposition changes for a Function
- New catalog task → create matching `backlogs/task-{id}/` and set **Backlog** link

## When not to update

- One-off change, bugfix, or client-specific request → only [backlogs/](../backlogs/)

## Analyze checklist

- [ ] Request maps to an existing **Function**
- [ ] Request maps to an existing **Task** row (check **Backlog** link)
- [ ] New catalog task? → add row + create `backlogs/task-{id}/` + link in **Backlog** column
- [ ] New Function needed? → update catalog + create backlog tasks

## Agent rule

When creating a catalog task row:

1. Assign `task-{id}` (next free id).
2. Create `backlogs/task-{id}/README.md` from [_task.template.md](../backlogs/_task.template.md).
3. Set **Backlog** column to `[task-{id}](../backlogs/task-{id}/)`.
4. Keep **Task** column as human-readable title only.
