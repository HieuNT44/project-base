# WORKFLOW DEFINE

Biến yêu cầu thô thành **một task draft** để sang khâu Plan.

Tham chiếu: [01_WORKFLOW.md](./01_WORKFLOW.md) · Skill: [create-task-draft](../.cursor/skills/create-task-draft/SKILL.md)

---

## 1) Input

Yêu cầu chưa thành task: chat, email, ticket, biên bản họp…

- Gom nguồn ở **Notion / Jira / Excel** (bên ngoài repo) được.
- **Không** lưu bản gốc yêu cầu vào repo — chỉ lưu task draft trong `.backlogs/`.

## 2) Output


| Artifact | Trạng thái |
| -------- | ---------- |
| `.backlogs/{id}/draft/{id}.md` | **draft** |


## 3) STEP


| #   | Bước                     | Bắt buộc                              | Việc cần làm                                 | Đầu ra                                                           | Skill (Cursor)      |
| --- | ------------------------ | ------------------------------------- | -------------------------------------------- | ---------------------------------------------------------------- | ------------------- |
| 1   | Thu gom & sàng lọc       | **Bắt buộc**                          | Gom nguồn một chỗ; bỏ trùng / không khả thi  | Danh sách mong muốn ngắn                                         | —                   |
| 2   | Tìm gốc rễ               | Tuỳ chọn *(bắt buộc nếu chưa rõ)*     | Ai gặp vấn đề? Muốn làm gì? Vì sao?          | User story: *As a… I want… So that…*                             | `interview-me`      |
| 3   | Chốt hướng               | Tuỳ chọn *(bắt buộc nếu nhiều hướng)* | So sánh cách làm, chọn một                   | Một hướng đã chốt                                                | `idea-refine`       |
| 4   | Đối chiếu dự án          | **Bắt buộc**                          | Đọc `01` scope, `02` function-list, `03` NFR | Ghi vào §8 **References** + dòng **Notebook** (Plan có thể chốt) | —                   |
| 5   | Phác thảo luồng          | Tuỳ chọn *(nên có với feature)*       | Happy path + edge cases                      | Gạch đầu dòng luồng xử lý                                        | —                   |
| 6   | Viết tiêu chí nghiệm thu | **Bắt buộc**                          | Given – When – Then                          | Acceptance criteria                                              | —                   |
| 7   | Đóng gói task draft      | **Bắt buộc**                          | Gom bước 2–6 vào file task                   | `.backlogs/{id}/draft/{id}.md`                       | `create-task-draft` |


## 4) Tạo Task Draft

### Các phần task (mục 0 + 8 mục + metadata)


| #   | Mục                             | Define (`draft`)                      | Ghi chú                   |
| --- | ------------------------------- | ------------------------------------- | ------------------------- |
| —   | **Metadata**                    | Tiêu đề, Type, Status `draft`         | Function link `02` nếu có |
| 0   | **Nguồn đầu vào (Intake)**      | Link ticket + tóm tắt đã xử lý        | Không lưu intake thô repo |
| 1   | **Mô tả bài toán (User Story)** | As a / I want / So that               | Bắt buộc                  |
| 2   | **Mô tả & Nhiệm vụ**            | Làm gì khi xong; UI/data/API nếu biết | Bắt buộc                  |
| 3   | **Luồng xử lý chính**           | Happy path                            | Nên có với feature        |
| 4   | **Tiêu chí nghiệm thu**         | Given – When – Then                   | Bắt buộc                  |
| 5   | **Tiêu chí hoàn thành**         | Để trống hoặc nháp                    | Plan chốt                 |
| 6   | **TTD (test case)**             | Tuỳ chọn nháp                         | Plan bắt buộc             |
| 7   | **Non-functional**              | Optional                              | NFR từ `03`               |
| 8   | **References**                  | Notebook, ticket, Figma, API…         | Bắt buộc                  |


Template: [`.backlogs/_task.template.md`](../.backlogs/_task.template.md)

## 5) Ví dụ task draft

Giả định từ biên bản họp thô:

> *"Khách hàng phàn nàn mua hàng xong không biết đơn hàng đang ở đâu, muốn có chỗ xem trạng thái vận chuyển giống như Shopee."*

```markdown
# Tích hợp tính năng Theo dõi trạng thái vận chuyển của đơn hàng

**ID:** DEV_001 | **Type:** feature | **Status:** draft
**Function:** — | **Estimate:** — | **Assignee:** — | **Subtasks:** không

## 0. Nguồn đầu vào (Intake)

| Nguồn | Link / vị trí | Ngày | Tóm tắt |
|-------|---------------|------|---------|
| Ticket KH | Jira PROJ-456 | 2026-06-18 | Muốn xem trạng thái vận chuyển như Shopee |

**Yêu cầu gốc (rút gọn):** *"Khách hàng phàn nàn mua hàng xong không biết đơn hàng đang ở đâu…"*

## 1. Mô tả bài toán (User Story)

As a: Khách hàng đã mua sản phẩm trên hệ thống.
I want to: Xem được lộ trình và trạng thái vận chuyển chi tiết của đơn hàng (Đang chuẩn bị, Đang giao, Đã giao).
So that: Chủ động biết khi nào hàng đến để nhận, giảm lo lắng và giảm tỷ lệ gọi hotline hỗ trợ.

## 2. Mô tả & Nhiệm vụ

- Hiển thị timeline vận chuyển trên trang Chi tiết đơn hàng.
- Đồng bộ mã vận đơn (Tracking ID) qua API đối tác (GHN / GHTK / Viettel Post).
- UI: link Figma timeline [TBD].

## 3. Luồng xử lý chính (User Flow & Happy Path)

1. Người dùng vào mục Đơn hàng của tôi.
2. Bấm vào một đơn hàng cụ thể để xem Chi tiết đơn hàng.
3. Hệ thống hiển thị Timeline các mốc vận chuyển (Thời gian + Trạng thái).

## 4. Tiêu chí nghiệm thu (Acceptance Criteria)

AC 1: Hiển thị trục mốc thời gian vận chuyển
Given: Người dùng đang ở trang Chi tiết đơn hàng.
When: Đơn hàng đã được bàn giao cho đơn vị vận chuyển.
Then: Hệ thống hiển thị trục thời gian với các trạng thái cập nhật theo thời gian thực (Real-time).

AC 2: Xử lý trường hợp Đơn hàng bị hủy (Edge Case)
Given: Người dùng đang xem đơn hàng.
When: Đơn hàng bị hủy do hết hàng hoặc người dùng chủ động hủy.
Then: Trục thời gian đổi sang màu đỏ, hiển thị trạng thái "Đã hủy đơn" kèm lý do hủy đơn.

AC 3: Trường hợp chưa có thông tin vận chuyển (Edge Case)
Given: Đơn hàng mới được tạo thành công.
When: Cửa hàng chưa đóng gói và chưa giao cho shipper.
Then: Trục thời gian chỉ hiển thị duy nhất một mốc: "Đơn hàng đã đặt thành công".

## 5. Tiêu chí hoàn thành

_(Plan chốt — draft để trống.)_

## 6. TTD (test case)

_(Plan bổ sung.)_

## 7. Non-functional _(optional)_

Cập nhật trạng thái real-time (ref `.notebook/03_non-functional-requirements/`).

## 8. References

| Tài liệu | Link | Dùng để |
|----------|------|---------|
| Scope dự án | .notebook/01_business-requirements/ | Kiểm tra in-scope |
| NFR tích hợp | .notebook/03_non-functional-requirements/ | API, real-time |
| API GHN | [TBD] | Tracking ID |
| Figma timeline | [TBD] | UI |
| Ticket KH | _(chi tiết §0 Intake)_ | Yêu cầu gốc |
```

*Ghi vào [`.backlogs/_task.template.md`](../.backlogs/_task.template.md). §5–6 + **Plan — Todo** hoàn thiện ở Plan. Skill: [create-task-draft](../.cursor/skills/create-task-draft/SKILL.md).*

**Bước tiếp:** [03_WORKFLOW_PLAN.md](./03_WORKFLOW_PLAN.md)
