# project-base

**Mẫu khởi tạo dự án phần mềm làm việc cùng AI Agent** — gắn quy trình SLDC, tài liệu spec và skills vào Git để agent và dev làm việc theo cùng một chuẩn.

---

## Ý tưởng

### Vấn đề khi dùng Agent coding

- Thiếu tính nhất quán: AI có thể viết mã tốt ở lượt này nhưng lại bỏ qua các bước quan trọng (như viết thử nghiệm, kiểm tra bảo mật) ở lượt khác.
- Thiếu bằng chứng xác thực: AI thường khẳng định "Mã đã chạy tốt" dựa trên suy đoán thay vì thực sự chạy thử nghiệm (test) hoặc kiểm tra lỗi (debug) một cách nghiêm ngặt.
- Không biết bắt đầu từ đâu khi nhận yêu cầu

### Giải pháp

- Tạo workflow SDLC
- Tạo các input/output cho mỗi flow
- Gán các skills, rule AI tương ứng cho mỗi flow

```
INTAKE (bên ngoài — không lưu repo) 
    ↓
DEFINE      →  .backlogs/{id}/draft/
    ↓
PLAN        →  .backlogs/{id}/ready/
    ↓
DESIGN      →  .backlogs/{id}/design/ + 06_design/
    ↓
TDD         →  test/file.md || script
    ↓
DEVELOP     →  code (backend / frontend / infra)
    ↓
REVIEW      →  PR, Unit Test ( test/ )
    ↓
TEST        →  verification trong task
    ↓
REPORT      →  .notebook/05_reports/
    ↓
DEPLOY      →  release / smoke
```

---

## 1) Cấu trúc dự án & tài liệu


| Thư mục                                                   | Vai trò                                                   |
| --------------------------------------------------------- | --------------------------------------------------------- |
| [.notebook/](./.notebook/)                                | Spec dự án: BRD, function list, NFR, WBS, design, báo cáo |
| [.backlogs/](./.backlogs/)                                | Task theo phase: `draft` → `ready` → `design`             |
| [.workflow-sldc/](./.workflow-sldc/)                      | Quy trình SLDC chi tiết từng phase                        |
| [.cursor/](./.cursor/)                                    | Rules · skills · commands · agents · hooks                |
| [.agent/](./.agent/)                                      | Reference & vendor skills bổ sung                         |
| `backend/` · `frontend/` · `infra/` · `test/` · `script/` | Code và vận hành                                          |


```
project-base/
├── WORKFLOW.md
├── .notebook/                         # Catalog & design docs
│   ├── 00_references/                 # INVEST, Definition of Done
│   ├── 01_business-requirements/      # WHY — stakeholder, scope
│   ├── 02_function-list/              # WHAT — catalog chức năng
│   ├── 03_non-functional-requirements/  # NFR
│   ├── 04_wbs/                        # Phân rã công việc → link backlog
│   ├── 05_reports/                    # Báo cáo bàn giao / tiến độ
│   └── 06_design/
│       ├── basic-design/              # BD — phối cảnh & khung trước code
│       │   ├── system-overview/
│       │   ├── architecture-fe/
│       │   ├── architecture-be/
│       │   ├── screen-list/
│       │   ├── screen-flow/
│       │   ├── api-error-handling/
│       │   ├── matrix-design/
│       │   ├── batch-overview/
│       │   └── external-interface-overview/
│       └── detail-design/             # DD — spec đủ để implement
│           ├── fields-validation-messages/
│           ├── database-erd/
│           ├── database-table-definition/
│           ├── database-data-dictionary/
│           ├── api-document/
│           ├── sequence-diagram/
│           ├── class-design/
│           ├── logic-design/
│           ├── interface-specification/
│           └── batch-design/
├── .backlogs/                         # Task thực thi
│   └── {id}/
│       ├── draft/{id}.md              # Define — intake §0, story, AC nháp
│       ├── ready/{id}.md              # Plan — TTD, Todo, estimate
│       └── design/{id}.md           # Design — handoff Code
├── .workflow-sldc/
├── .cursor/rules/ + skills/ + commands/ + agents/ + hooks.json
├── .agent/
└── backend/ · frontend/ · infra/ · test/ · script/
```

---

## 2) Workflow SLDC — cách dùng

Đọc theo thứ tự trong [.workflow-sldc/](./.workflow-sldc/README.md):


| Phase       | Input                                                                                                | Output                                                   |
| ----------- | ---------------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| **Intake**  | Chat, Redmine, họp *(ngoài repo)*                                                                    | Thông tin, tài liệu ( md, text )                         |
| **Define**  | - md, text yêu cầu - tài liệu ở notebook dự án                                                       | `.backlogs/{id}/draft/`                                  |
| **Plan**    | - `backlogs/{id}/draft/`- nguồn nhân sự thực tế- tài liệu ở notebook dự án                          | - `backlogs/{id}/ready/` - Testcase ( tư duy TDD )       |
| **Design**  | - `backlogs/{id}/ready/`- tài liệu ở notebook dự án                                                 | `.backlogs/{id}/design/` + Basic design, details design |
| **Develop** | - Basic design, details design- Task/ EST / Todo- Test case ( TDD )- Skills, rules, tài liệu dự án | `PR`                                                     |
| **Review**  | PR · diff code                                                                                       | PR approved                                              |
| **Test**    | Deploy trên develop env                                                                              | Pass test                                                |
| **Report**  | Task `done` · evidence verify                                                                        | `.notebook/05_reports/`                                  |
| **Deploy**  | Release candidate · `infra/`                                                                         | Staging/production                                       |




### Luồng làm việc thực tế

1. **Intake** — yêu cầu từ chat / Redmine; không commit bản gốc vào repo.
2. **Define** — `draft/{id}.md` (§0, story, AC, luồng).
3. **Plan** — chốt `ready/` sau INVEST + duyệt PM (TTD khung, Todo).
4. **Design** — `design/{id}.md` + `06_design/` khi scope M+.
5. **TDD** — chi tiết §6, viết test RED trước code.
6. **Develop** — implement theo handoff; tick Todo.
7. **Review** — PR, code review.
8. **Test** — chạy TTD, tick §5–§6, bằng chứng verify.
9. **Report** — `05_reports/` khi `done`.
10. **Deploy** — release / smoke (nếu có).

### Dùng với Cursor

- **Slash commands:** `/define` · `/plan` · `/design` · `/tdd` · `/build` · `/test` · `/review` · `/ship` · `/report` — [commands/README.md](./.cursor/commands/README.md)
- Agent tự chọn skill theo [rules/00-workflow.mdc](./.cursor/rules/00-workflow.mdc) hoặc [AGENTS.md](./AGENTS.md)
- Gọi tường minh: `@design-workflow`, `@planning-and-task-breakdown`, …
- Entry: [WORKFLOW.md](./WORKFLOW.md) → `01_WORKFLOW.md`

---

## 3) Skills theo workflow

Skills trong [.cursor/skills/](./.cursor/skills/) — mỗi skill là workflow có bước, checkpoint và anti-rationalization. Gọi `@skill-name` hoặc để agent tự chọn theo [rules/00-workflow.mdc](./.cursor/rules/00-workflow.mdc). Kế thừa [agent-skills](https://github.com/addyosmani/agent-skills), bổ sung skills gắn artifact SLDC (`create-task-draft`, `design-workflow`, `report-writer`).

### Cách skill hoạt động

Mỗi skill theo cùng một anatomy:

```
┌─────────────────────────────────────────────────┐
│  SKILL.md                                       │
│                                                 │
│  ┌─ Frontmatter ─────────────────────────────┐  │
│  │ name: lowercase-hyphen-name               │  │
│  │ description: Guides agents through [task].│  │
│  │              Use when…                    │  │
│  └───────────────────────────────────────────┘  │
│  Overview         → Skill làm gì                │
│  When to Use      → Điều kiện kích hoạt         │
│  Process          → Workflow từng bước            │
│  Rationalizations → Cớ lý bỏ qua + phản bác     │
│  Red Flags        → Dấu hiệu vi phạm            │
│  Verification     → Bằng chứng bắt buộc         │
└─────────────────────────────────────────────────┘
```

Nguyên tắc thiết kế:

- **Process, not prose.** Skill là workflow agent *follow*, không phải tài liệu đọc cho biết. Mỗi skill có bước, checkpoint, exit criteria.
- **Anti-rationalization.** Bảng cớ thường gặp để bỏ qua bước (vd. "test sau") kèm counter-argument.
- **Verification bắt buộc.** Kết thúc bằng evidence — test pass, build output, runtime data. "Seems right" không đủ.
- **Progressive disclosure.** `SKILL.md` là entry point; checklist trong `00_references/` chỉ load khi cần — tiết kiệm context.

### Commands

Gõ `/` trong Cursor chat. Chi tiết: [.cursor/commands/README.md](./.cursor/commands/README.md).


| What you're doing          | Command          | Key principle                                            |
| -------------------------- | ---------------- | -------------------------------------------------------- |
| Làm rõ yêu cầu → task nháp | `/define`        | Intake → `draft/`, không lưu bản gốc vào repo            |
| Cập nhật catalog notebook  | `/spec`          | Spec trong `01`–`03`, không `SPEC.md` ở root             |
| Chốt scope → `ready`       | `/plan`          | INVEST + PM duyệt trước khi code                         |
| Thiết kế trước code        | `/design`        | M+ bắt buộc `design/{id}.md` + `06_design/`              |
| Viết test case trước       | `/tdd`           | RED theo design — trước implement                        |
| Implement từng slice       | `/build`         | Một Todo / một commit; `/build auto` khi đã approve plan |
| Chứng minh hoạt động đúng  | `/test`          | Evidence + DoD — không assume                            |
| Review trước merge         | `/review`        | Cải thiện code health, không chỉ "LGTM"                  |
| Pre-launch go/no-go        | `/ship`          | Fan-out 3 persona → merge + rollback plan                |
| Bàn giao PM/khách          | `/report`        | `05_reports/` khi task `done`                            |
| Audit hiệu năng web        | `/webperf`       | Measure first — không bịa metric                         |
| Đơn giản hóa code          | `/code-simplify` | Rõ ràng hơn clever — giữ nguyên behavior                 |


### Tất cả 27 skills

27 skill — 26 lifecycle + meta `using-agent-skills`. Có thể tham chiếu trực tiếp từng file `SKILL.md`.

### Meta — Chọn skill phù hợp


| Skill                                                            | Mô tả                                                         | Dùng khi                                 |
| ---------------------------------------------------------------- | ------------------------------------------------------------- | ---------------------------------------- |
| [using-agent-skills](.cursor/skills/using-agent-skills/SKILL.md) | Map công việc vào đúng skill workflow; quy tắc vận hành chung | Bắt đầu session hoặc chưa biết skill nào |


### Define — Làm rõ cần build gì


| Skill                                                                      | Mô tả                                                                     | Dùng khi                                            |
| -------------------------------------------------------------------------- | ------------------------------------------------------------------------- | --------------------------------------------------- |
| [interview-me](.cursor/skills/interview-me/SKILL.md)                       | Phỏng vấn từng câu một để khai thác ý định thật (~95% confidence)         | Yêu cầu mơ hồ; user gọi "interview me" / "grill me" |
| [idea-refine](.cursor/skills/idea-refine/SKILL.md)                         | Tư duy phân kỳ/hội tụ — biến ý tưởng thô thành đề xuất cụ thể             | Ý tưởng sơ bộ cần khám phá hướng                    |
| [create-task-draft](.cursor/skills/create-task-draft/SKILL.md)             | Đóng gói yêu cầu đã rõ thành một task `draft` trong `.backlogs/`          | Sau Define; cần `draft/{id}.md` trước Plan          |
| [spec-driven-development](.cursor/skills/spec-driven-development/SKILL.md) | Spec trước code — cập nhật catalog notebook `01`–`03`, phạm vi, ranh giới | Dự án/feature mới hoặc thay đổi đáng kể phạm vi     |


### Plan — Chia nhỏ công việc


| Skill                                                                              | Mô tả                                                     | Dùng khi                                 |
| ---------------------------------------------------------------------------------- | --------------------------------------------------------- | ---------------------------------------- |
| [planning-and-task-breakdown](.cursor/skills/planning-and-task-breakdown/SKILL.md) | Chia spec thành task nhỏ, INVEST, AC, phụ thuộc → `ready` | Đã có `draft`; cần chốt scope + PM duyệt |


### Design — Thiết kế trước code


| Skill                                                      | Mô tả                                                                                  | Dùng khi                                            |
| ---------------------------------------------------------- | -------------------------------------------------------------------------------------- | --------------------------------------------------- |
| [design-workflow](.cursor/skills/design-workflow/SKILL.md) | Phase Design — đề xuất `06_design/`, viết `.backlogs/{id}/design/{id}.md` handoff Code | Đã có `ready/{id}.md`; scope M+ bắt buộc trước code |


### Build — Viết code


| Skill                                                                            | Mô tả                                                                                  | Dùng khi                                                |
| -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | ------------------------------------------------------- |
| [incremental-implementation](.cursor/skills/incremental-implementation/SKILL.md) | Vertical slice mỏng — implement, test, verify, commit; feature flag, rollback-friendly | Thay đổi chạm nhiều file                                |
| [test-driven-development](.cursor/skills/test-driven-development/SKILL.md)       | Red-Green-Refactor, test pyramid, DAMP over DRY, browser testing                       | Logic mới, sửa bug, đổi hành vi — sau Design            |
| [context-engineering](.cursor/skills/context-engineering/SKILL.md)               | Cung cấp đúng context đúng lúc — rules, context packing, MCP                           | Session mới, đổi task, chất lượng agent giảm            |
| [source-driven-development](.cursor/skills/source-driven-development/SKILL.md)   | Mọi quyết định framework dựa doc chính thức — verify, cite, flag unverified            | Cần code có nguồn authoritative                         |
| [doubt-driven-development](.cursor/skills/doubt-driven-development/SKILL.md)     | Review phản biện in-flight — CLAIM → EXTRACT → DOUBT → RECONCILE                       | Production, security, code lạ, quyết định không thể đảo |
| [frontend-ui-engineering](.cursor/skills/frontend-ui-engineering/SKILL.md)       | Component architecture, design system, state, responsive, WCAG 2.1 AA                  | UI/UX user-facing                                       |
| [api-and-interface-design](.cursor/skills/api-and-interface-design/SKILL.md)     | Contract-first, Hyrum's Law, error semantics, boundary validation                      | API, module boundary, public interface                  |


### Verify — Chứng minh hoạt động đúng


| Skill                                                                                  | Mô tả                                                                          | Dùng khi                             |
| -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ | ------------------------------------ |
| [browser-testing-with-devtools](.cursor/skills/browser-testing-with-devtools/SKILL.md) | Chrome DevTools MCP — DOM, console, network, performance với data runtime thật | App chạy trên browser                |
| [debugging-and-error-recovery](.cursor/skills/debugging-and-error-recovery/SKILL.md)   | Triage 5 bước: reproduce → localize → reduce → fix → guard                     | Test fail, build break, hành vi lệch |


### Review — Quality gate trước merge


| Skill                                                                        | Mô tả                                                                   | Dùng khi                                  |
| ---------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------- |
| [code-review-and-quality](.cursor/skills/code-review-and-quality/SKILL.md)   | Review 5 trục, change sizing ~100 dòng, severity labels, split strategy | Trước merge mọi thay đổi                  |
| [code-simplification](.cursor/skills/code-simplification/SKILL.md)           | Chesterton's Fence, Rule of 500 — đơn giản hóa giữ nguyên behavior      | Code chạy nhưng khó đọc/bảo trì           |
| [security-and-hardening](.cursor/skills/security-and-hardening/SKILL.md)     | OWASP Top 10, auth, secrets, dependency audit, boundary 3 tầng          | Input user, auth, storage, tích hợp ngoài |
| [performance-optimization](.cursor/skills/performance-optimization/SKILL.md) | Measure-first — Core Web Vitals, profiling, bundle analysis             | Có yêu cầu perf hoặc nghi ngờ regression  |


### Deploy


| Skill                                                                                          | Mô tả                                                                 | Dùng khi                                    |
| ---------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- | ------------------------------------------- |
| [git-workflow-and-versioning](.cursor/skills/git-workflow-and-versioning/SKILL.md)             | Trunk-based, atomic commit, change sizing, commit-as-save-point       | Mọi thay đổi code                           |
| [ci-cd-and-automation](.cursor/skills/ci-cd-and-automation/SKILL.md)                           | Shift Left, quality gate pipeline, feature flags, failure feedback    | Setup/sửa CI/CD                             |
| [deprecation-and-migration](.cursor/skills/deprecation-and-migration/SKILL.md)                 | Deprecation bắt buộc/tư vấn, migration pattern, xóa zombie code       | Sunset hệ thống cũ, migrate user            |
| [documentation-and-adrs](.cursor/skills/documentation-and-adrs/SKILL.md)                       | ADR, API docs, inline standards — ghi *why*                           | Quyết định kiến trúc, đổi API, ship feature |
| [observability-and-instrumentation](.cursor/skills/observability-and-instrumentation/SKILL.md) | Structured logging, RED metrics, OpenTelemetry, alerting theo symptom | Telemetry, production                       |
| [shipping-and-launch](.cursor/skills/shipping-and-launch/SKILL.md)                             | Pre-launch checklist, staged rollout, rollback, monitoring            | Chuẩn bị release production                 |


### Report — Bàn giao


| Skill                                                  | Mô tả                                                                     | Dùng khi                       |
| ------------------------------------------------------ | ------------------------------------------------------------------------- | ------------------------------ |
| [report-writer](.cursor/skills/report-writer/SKILL.md) | Soạn báo cáo task delivery/tiến độ/sprint/incident theo mẫu `05_reports/` | Task `done`, bàn giao PM/khách |


### Agent Personas

Persona chuyên gia cấu hình sẵn — dùng cho review/audit có góc nhìn rõ. File trong [.cursor/agents/](./.cursor/agents/).


| Agent                                                                | Vai trò                  | Góc nhìn                                                                    |
| -------------------------------------------------------------------- | ------------------------ | --------------------------------------------------------------------------- |
| [code-reviewer](.cursor/agents/code-reviewer.md)                     | Senior Staff Engineer    | Review 5 trục — tiêu chuẩn "staff engineer có approve không?"               |
| [test-engineer](.cursor/agents/test-engineer.md)                     | QA Specialist            | Chiến lược test, coverage, Prove-It pattern                                 |
| [security-auditor](.cursor/agents/security-auditor.md)               | Security Engineer        | Phát hiện lỗ hổng, threat modeling, đánh giá OWASP                          |
| [web-performance-auditor](.cursor/agents/web-performance-auditor.md) | Web Performance Engineer | Audit Core Web Vitals — Quick/Deep mode, metric-honesty; gọi qua `/webperf` |


Xem [.cursor/agents/README.md](./.cursor/agents/README.md) và [orchestration-patterns.md](./.notebook/00_references/orchestration-patterns.md) — decision matrix, quy tắc orchestration, cách persona kết hợp với skill và slash command.

### Reference Checklists

Tài liệu tham chiếu nhanh — skill load khi cần. Nguồn: [.notebook/00_references/](./.notebook/00_references/).


| Reference                                                                          | Nội dung                                                                           |
| ---------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| [definition-of-done.md](./.notebook/00_references/definition-of-done.md)           | Bar chất lượng cố định mọi thay đổi phải đạt — khác với AC từng task               |
| [invest.md](./.notebook/00_references/invest.md)                                   | Tiêu chí INVEST — gate Plan trước `ready`                                          |
| [testing-patterns.md](./.notebook/00_references/testing-patterns.md)               | Cấu trúc test, naming, mocking, ví dụ React/API/E2E, anti-patterns                 |
| [security-checklist.md](./.notebook/00_references/security-checklist.md)           | Pre-commit, auth, input validation, headers, CORS, OWASP Top 10                    |
| [performance-checklist.md](./.notebook/00_references/performance-checklist.md)     | Core Web Vitals, checklist FE/BE, lệnh đo                                          |
| [accessibility-checklist.md](./.notebook/00_references/accessibility-checklist.md) | Keyboard, screen reader, visual, ARIA, công cụ test                                |
| [observability-checklist.md](./.notebook/00_references/observability-checklist.md) | On-call questions, structured logging, RED/USE, tracing, alerting, pre-launch gate |
| [orchestration-patterns.md](./.notebook/00_references/orchestration-patterns.md)   | Pattern fan-out đa persona, anti-patterns, quy tắc "persona không gọi persona"     |


Bảng tóm tắt skill: [.cursor/skills/README.md](./.cursor/skills/README.md)

---

