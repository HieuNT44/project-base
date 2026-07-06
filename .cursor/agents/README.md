# Agent personas

Specialist roles for review and audit. Each file is a **persona** (who + output format). Pair with **skills** (how) from [.cursor/skills/](../skills/README.md).

| Persona | Role | Command |
|---------|------|---------|
| [code-reviewer](./code-reviewer.md) | Five-axis review | `/review`, `/ship` |
| [security-auditor](./security-auditor.md) | Security / OWASP audit | `/ship` |
| [test-engineer](./test-engineer.md) | Coverage / test strategy | `/test`, `/ship` |
| [web-performance-auditor](./web-performance-auditor.md) | Core Web Vitals audit | `/webperf` |

## Three layers

| Layer | Location | Job |
|-------|----------|-----|
| **Skill** | `.cursor/skills/{name}/SKILL.md` | Workflow with steps and exit criteria |
| **Persona** | `.cursor/agents/{name}.md` | Single perspective + report format |
| **Command** | `.cursor/commands/{name}.md` | User entry point (`/name` in chat) |

**Rule:** Personas do not invoke other personas. `/ship` is the only fan-out orchestrator — see [.notebook/00_references/orchestration-patterns.md](../../.notebook/00_references/orchestration-patterns.md).

## Usage in Cursor

- **Direct:** “Review this diff as `code-reviewer`” or attach persona file
- **Command:** `/review`, `/ship`, `/webperf`
- **Parallel fan-out (`/ship`):** Launch multiple Task subagents in one turn — one per persona — then merge reports in main context
