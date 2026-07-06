# Review — code review trước merge

Invoke **`code-review-and-quality`** skill. Adopt **[code-reviewer](../agents/code-reviewer.md)** persona perspective.

Review staged changes or recent commits across five axes:

1. **Correctness** — spec/task AC, edge cases, tests
2. **Readability** — names, structure, intent
3. **Architecture** — patterns, boundaries, coupling
4. **Security** — use [security-checklist](../../.notebook/00_references/security-checklist.md); escalate to `security-and-hardening` skill
5. **Performance** — use [performance-checklist](../../.notebook/00_references/performance-checklist.md) when relevant

Output: Critical / Important / Suggestion with file:line and fix recommendations. Verdict: APPROVE | REQUEST CHANGES.
