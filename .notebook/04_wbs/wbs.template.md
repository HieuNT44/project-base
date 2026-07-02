# WBS — {Tên dự án hoặc phase}

Copy to `wbs.md` when defining or updating project work breakdown.

| WBS ID | Tên | Cấp | Cha | Backlog | Function | Trạng thái | Ghi chú |
|--------|-----|-----|-----|---------|----------|------------|---------|
| 1 | {Phase / release} | 1 | — | — | — | planned | |
| 1.1 | {Module / epic} | 2 | 1 | — | {Function từ 02} | planned | |
| 1.1.1 | {Work package} | 3 | 1.1 | [TBD](../../.backlogs/) hoặc [{id}](../../.backlogs/{id}/ready/{id}.md) | | planned | |

## Column guide

| Column | Purpose |
|--------|---------|
| **WBS ID** | Hierarchical id — `1`, `1.1`, `1.1.1` |
| **Tên** | Readable name for phase, module, or package |
| **Cấp** | Depth: 1 = phase, 2 = module, 3 = package, 4 = leaf (optional) |
| **Cha** | Parent WBS ID; empty for level 1 |
| **Backlog** | Link to `.backlogs/{id}/ready/{id}.md` when task exists; `TBD` until Define/Plan |
| **Function** | Optional link to [02_function-list](../02_function-list/) row |
| **Trạng thái** | `planned` · `in-progress` · `done` — rollup từ leaf khi cần |
| **Ghi chú** | Dependencies, milestone, estimate rollup |

## Notes

- WBS = **cấu trúc dự án**; acceptance criteria và Todo nằm trong [`.backlogs`](../../.backlogs/).
- Một leaf WBS thường map **một** folder `.backlogs/{id}/`.
- One-off / bugfix → backlog only; không bắt buộc thêm dòng WBS.
