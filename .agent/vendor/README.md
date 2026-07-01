# Vendor skills (optional)

Clone upstream libraries when the project stack is defined:

```bash
# From repo root — examples
git submodule add https://github.com/your-org/agent-skills .agent/vendor/agent-skills
git submodule add https://github.com/your-org/superpowers .agent/vendor/superpowers
```

Or copy from an existing monorepo path.

## Suggested develop-phase skills

| Skill | Source | Use when |
|-------|--------|----------|
| `test-driven-development` | agent-skills | Code changes with tests |
| `incremental-implementation` | agent-skills | Multi-step features |
| `verification-before-completion` | superpowers | Before marking task `done` |
| `code-review-and-quality` | agent-skills | Pre-merge review |
| `debugging-and-error-recovery` | agent-skills | Bugs |

Paths after clone: `.agent/vendor/agent-skills/skills/{name}/SKILL.md`

Do not duplicate vendor skills into `.cursor/skills/` — reference them from backlog **Implementation** section.
