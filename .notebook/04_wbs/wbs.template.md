# WBS — {Tên dự án hoặc phase}

Copy thành `wbs.md` khi định nghĩa hoặc cập nhật cấu trúc phân rã công việc.

| WBS ID | Tên | Cấp | Cha | Backlog | Function | Trạng thái | Ghi chú |
|--------|-----|-----|-----|---------|----------|------------|---------|
| 1 | {Phase / release} | 1 | — | — | — | planned | |
| 1.1 | {Module / epic} | 2 | 1 | — | {Function từ 02} | planned | |
| 1.1.1 | {Work package} | 3 | 1.1 | [TBD](../../.backlogs/) hoặc [{id}](../../.backlogs/{id}/ready/{id}.md) | | planned | |

## Hướng dẫn từng cột

| Cột | Mục đích |
|-----|----------|
| **WBS ID** | Mã phân cấp — `1`, `1.1`, `1.1.1` |
| **Tên** | Tên phase, module hoặc package — dễ đọc |
| **Cấp** | Độ sâu: 1 = phase, 2 = module, 3 = package, 4 = leaf (tuỳ chọn) |
| **Cha** | WBS ID cha; để trống nếu cấp 1 |
| **Backlog** | Link tới `.backlogs/{id}/ready/{id}.md` khi đã có task; `TBD` cho đến khi Define/Plan |
| **Function** | Tuỳ chọn — tham chiếu dòng [02_function-list](../02_function-list/) |
| **Trạng thái** | `planned` · `in-progress` · `done` — có thể rollup từ leaf |
| **Ghi chú** | Phụ thuộc, milestone, tổng estimate |

## Ghi chú

- WBS = **cấu trúc dự án**; tiêu chí nghiệm thu và Todo nằm trong [`.backlogs`](../../.backlogs/).
- Một leaf WBS thường map **một** folder `.backlogs/{id}/`.
- Việc một lần / bugfix → chỉ backlog; không bắt buộc thêm dòng WBS.
