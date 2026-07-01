# Function list — {Product or module name}

Copy to `catalog.md` when defining the functional catalog for a project.

| Function | Task | Backlog | Summary | Outcome |
|----------|------|---------|---------|---------|
| **{Function name}** | {Task title — short label} | [task-{id}](../../backlogs/task-{id}/) | What this standard task covers | Value for user or business |
| | {Another task title} | [task-{id}](../../backlogs/task-{id}/) | | |
| | {Task not created yet} | TBD | Planned task | | |

## Column guide

| Column | Purpose |
|--------|---------|
| **Function** | Capability group. Write on the first row of each group only. |
| **Task** | Short readable name — not a link. |
| **Backlog** | Link to `../../backlogs/task-{id}/` (folder) or `TBD` if not created yet. |
| **Summary** | Plan-level description (what). No API names or detailed design. |
| **Outcome** | Business value. Usually on the first row of each Function group. |

## Notes

- One catalog row = one standard task = one backlog folder `task-{id}/`.
- One-off requests → create [backlogs](../../backlogs/) only; do not add a catalog row unless the product gains a new capability.
- Detailed acceptance criteria and verification live in the backlog task file, not in this table.
