# WBS — Work Breakdown Structure

Theo dõi **cấu trúc phân rã công việc** của dự án — cây WBS từ phase / module → work package → link task thực thi.

Chi tiết task (AC, Todo, design): [`.backlogs/`](../../.backlogs/) — **không** nhét vào WBS.

## Vai trò

| Tài liệu | Trả lời câu hỏi |
|----------|------------------|
| [01_business-requirements/](../01_business-requirements/) | Dự án làm gì, scope IN/OUT |
| [02_function-list/](../02_function-list/) | Hệ thống có những chức năng gì (catalog sản phẩm) |
| **04_wbs** (đây) | Dự án chia việc thế nào — phase, module, package |
| [`.backlogs/`](../../.backlogs/) | Task cụ thể để dev/agent làm (`draft` → `ready` → `design`) |

**02** = capability catalog · **04_wbs** = cấu trúc triển khai dự án · **`.backlogs/`** = executable spec.

## Files

| File | Purpose |
|------|---------|
| [wbs.template.md](./wbs.template.md) | Copy → `wbs.md` — bảng WBS master |

## Cột gợi ý (`wbs.md`)

| Cột | Mô tả |
|-----|--------|
| **WBS ID** | `1` · `1.1` · `1.1.1` — phân cấp |
| **Tên** | Phase / module / work package |
| **Cấp** | `1` phase · `2` module · `3` package · `4` leaf |
| **Cha** | WBS ID cha (trống nếu cấp 1) |
| **Backlog** | Link `.backlogs/{id}/ready/{id}.md` hoặc `TBD` |
| **Function** | Tham chiếu row [02_function-list](../02_function-list/) (nếu có) |
| **Trạng thái** | `planned` · `in-progress` · `done` |
| **Ghi chú** | Estimate rollup, dependency, milestone |

## Khi nào cập nhật

- Kickoff dự án / phase mới → tạo hoặc mở rộng `wbs.md`
- Thêm work package lớn → thêm dòng WBS + tạo `.backlogs/{id}/` khi sẵn sàng Define
- Task `done` → cập nhật **Trạng thái** trên WBS (leaf có Backlog link)

## Khi nào không cập nhật

- Bugfix / one-off nhỏ → chỉ `.backlogs/`, không cần dòng WBS mới
- Chi tiết AC, test, design → giữ trong task backlog

## Quick links

- [.backlogs/README.md](../../.backlogs/README.md) — lifecycle task
- [02_function-list/](../02_function-list/) — catalog chức năng
- [06_design/](../06_design/) — BD/DD
- [.workflow-sldc/02_WORKFLOW_DEFINE.md](../../.workflow-sldc/02_WORKFLOW_DEFINE.md) — Define → `draft/`

## Ví dụ (rút gọn)

| WBS ID | Tên | Cấp | Cha | Backlog | Trạng thái |
|--------|-----|-----|-----|---------|------------|
| 1 | Phase 1 — MVP | 1 | — | — | in-progress |
| 1.1 | Đơn hàng | 2 | 1 | — | in-progress |
| 1.1.1 | Theo dõi vận chuyển | 3 | 1.1 | [example_001](../../.backlogs/example_001/ready/example_001.md) | planned |
