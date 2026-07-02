# {Tiêu đề task}

**ID:** {id}  
**Path:** `.backlogs/{id}/draft/` → Plan: `ready/` → Design: `design/`  
**Type:** feature | bugfix | refactor | deploy  
**Function:** {link `.notebook/02_function-list/` hoặc `—`}  
**Status:** draft | ready | in-progress | done  
**Estimate:** — h _(Plan: **≤ 8h**/task; tách [Subtasks](#subtasks) nếu vượt)_  
**Assignee:** —  
**Subtasks:** không | có

Khung kế thừa [02_WORKFLOW_DEFINE.md](../.workflow-sldc/02_WORKFLOW_DEFINE.md) → hoàn thiện ở [03_WORKFLOW_PLAN.md](../.workflow-sldc/03_WORKFLOW_PLAN.md). Skill: [create-task-draft](../.cursor/skills/create-task-draft/SKILL.md) · [planning-and-task-breakdown](../.cursor/skills/planning-and-task-breakdown/SKILL.md).

---

## 1. Mô tả bài toán (User Story)

As a: …  
I want to: …  
So that: …

## 2. Mô tả & Nhiệm vụ

_(Define: làm gì khi xong. Plan: bóc tách bullet/feature cụ thể. Gộp UI/data/API nếu đã biết.)_

- …

## 3. Luồng xử lý chính (User Flow & Happy Path)

_(**feature** / **refactor**: happy path + edge. **bugfix**: **Steps to reproduce** + Expected vs Actual. **deploy**: runbook tóm tắt.)_

1. …

## 4. Tiêu chí nghiệm thu (Acceptance Criteria)

AC 1: …  
Given: …  
When: …  
Then: …

## 5. Tiêu chí hoàn thành

_(Plan: checklist trước `ready`. Develop/Test: tick khi xong.)_

- [ ] AC §4 pass
- [ ] TTD §6 pass
- [ ] Review / merge _(nếu có code)_
- [ ] [Báo cáo bàn giao](../.notebook/05_reports/) _(khi `done`)_

## 6. TTD (test case)

_(Plan: bắt buộc trước `ready`. **bugfix**: case repro **fail** trước fix.)_

| ID | Case | Loại | Kỳ vọng | Kết quả |
|----|------|------|---------|---------|
| T1 | … | unit \| integration \| e2e \| manual | … | — |

## 7. Non-functional _(optional)_

_(Chỉ khi liên quan [`.notebook/03_non-functional-requirements/`](../.notebook/03_non-functional-requirements/) — perf, bảo mật, …)_

—

## 8. References

| Tài liệu | Link | Dùng để |
|----------|------|---------|
| Scope | `.notebook/01_business-requirements/` | In/out scope |
| Function-list | `.notebook/02_function-list/` | Notebook row |
| NFR | `.notebook/03_non-functional-requirements/` | Ràng buộc |
| Ticket / nguồn | — | Jira / Redmine / biên bản họp |
| Thiết kế / API | — | Figma, API đối tác |
| Tracker ngoài | — | Redmine #… / Jira PROJ-… |

---

## Plan — Todo

_(**Plan** bắt buộc trước `ready`: thứ tự, giờ, người. **Develop**: tick **✓**.)_

| # | Việc | h | Ai | Sau # | ✓ |
|---|------|---|-----|-------|---|
| 1 | … | — | — | — | [ ] |

**Notebook:** in-scope ✓ \| no \| unclear · function-list: row \| one-off \| new · cập nhật `01`–`03`: không _(hoặc ghi link/note)_

## Subtasks

_(Bắt buộc khi **Estimate > 8h** — mỗi subtask ≤ 8h, cùng khung 8 mục trong [_subtask.template.md](./_subtask.template.md).)_

| Subtask | File | h | Status |
|---------|------|---|--------|
| {slug} | [{id}_{slug}.md](./{id}_{slug}.md) | — | draft |
