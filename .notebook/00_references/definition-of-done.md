# Definition of Done

Project-wide bar every change must clear before it counts as **done**. Unlike acceptance criteria (per task: "did we build the right thing?"), Definition of Done is fixed and answers "is this finished to our standard?".

## Definition of Done vs. Acceptance Criteria

| | Acceptance Criteria | Definition of Done |
|---|---|---|
| Scope | Specific to one task | Applies to every increment |
| Changes | Different for each item | Fixed and reused |
| Answers | "Did we build *this thing*?" | "Is it *ready*?" |
| Owner | Defined when planning the task | Defined once for the project |

A task is done only when **its** acceptance criteria are met **and** the standing Definition of Done is satisfied. [INVEST](./invest.md) is checked at Plan (`ready`); DoD is checked at Testing (`done`).

## Standing Checklist

Apply before setting task status to `done`.

### Correctness

- [ ] All acceptance criteria for the task are met
- [ ] Behavior verified at runtime (not only compile/typecheck)
- [ ] New behavior covered by tests that fail without the change and pass with it (when automated tests apply)
- [ ] Existing tests still pass; no regressions
- [ ] Edge cases and error paths handled, not only happy path

### Quality

- [ ] Code reveals intent through naming and structure
- [ ] No duplicated business logic
- [ ] No dead code, debug output, or commented-out blocks
- [ ] Changes scoped to the task; no unrelated refactors
- [ ] Linting and formatting pass

### Integration

- [ ] Change works with the rest of the system, not only in isolation
- [ ] Migrations, config, and feature flags accounted for
- [ ] Backward compatibility considered for public interfaces

### Documentation

- [ ] Public interfaces and user-facing behavior documented when changed
- [ ] Architectural decisions worth preserving are recorded
- [ ] Docs describe current state, not change history

### Ship-readiness

- [ ] Security implications reviewed for untrusted input, auth, or sensitive data
- [ ] Observability in place for new critical paths (when applicable)
- [ ] Rollback path exists for risky changes
- [ ] Human review and approval before merge or deploy (when required)

## How to Apply

| Level | Focus |
|-------|--------|
| Per task | Correctness + Quality |
| Per feature | + Integration + Documentation |
| Per release | Full checklist + deploy gates |

Tailor this list once per project, then reuse unchanged.

## Red Flags

- "It's done, I just haven't run it yet" — unverified work is not done.
- "Tests pass" while docs, regressions, or runtime verification are skipped.
- A different bar applied under deadline pressure.
- Acceptance criteria treated as the whole bar, with no standing quality floor.
- `done` declared before required human review.

## Related Skills

Optional agent skills in this repo: `.agent/vendor/agent-skills/skills/planning-and-task-breakdown`, `.agent/vendor/agent-skills/skills/test-driven-development`, `.agent/vendor/superpowers/skills/verification-before-completion`.
