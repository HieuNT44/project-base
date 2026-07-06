# Ship — pre-launch fan-out

Invoke **`shipping-and-launch`** skill. This is a **fan-out orchestrator**.

## Phase A — Parallel fan-out

Launch **three Task subagents in one turn** (parallel), each following one persona:

1. **[code-reviewer](../agents/code-reviewer.md)** — five-axis review on staged/recent changes
2. **[security-auditor](../agents/security-auditor.md)** — OWASP, secrets, auth, deps ([security-checklist](../../.notebook/00_references/security-checklist.md))
3. **[test-engineer](../agents/test-engineer.md)** — coverage gaps, Prove-It, edge cases

Personas do not call each other. See [.notebook/00_references/orchestration-patterns.md](../../.notebook/00_references/orchestration-patterns.md).

## Phase B — Merge (main context)

Synthesize reports:

1. Code quality — Critical/Important from reviewer + test/lint/build output
2. Security — promote Critical/High to blockers
3. Performance — from reviewer; CWV if web app
4. Accessibility — [accessibility-checklist](../../.notebook/00_references/accessibility-checklist.md)
5. Infrastructure — env, migrations, flags, monitoring
6. Documentation — README, ADRs

Apply [Definition of Done](../../.notebook/00_references/definition-of-done.md).

## Phase C — Decision

```markdown
## Ship Decision: GO | NO-GO

### Blockers
### Recommended fixes
### Rollback plan
```
