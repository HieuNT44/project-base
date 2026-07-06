# Cursor — project agent setup

Wires org skills and workflow into Cursor for any project cloned from **project-base**.

## Rules (auto-loaded)

| File | Scope |
|------|--------|
| [rules/00-workflow.mdc](./rules/00-workflow.mdc) | Always — full pipeline + skill routing |
| [rules/01-backlog-tasks.mdc](./rules/01-backlog-tasks.mdc) | When editing `.backlogs/**` |
| [rules/02-design-docs.mdc](./rules/02-design-docs.mdc) | When editing `.notebook/06_design/**` |

## Skills (source of truth)

Edit skills only under [skills/](./skills/). See [skills/README.md](./skills/README.md).

## Commands (`/` in chat)

[commands/README.md](./commands/README.md) — `/define`, `/plan`, `/design`, `/tdd`, `/build`, `/test`, `/review`, `/ship`, `/report`, …

## Personas

[agents/README.md](./agents/README.md) — `code-reviewer`, `security-auditor`, `test-engineer`, `web-performance-auditor`

## Hooks

[hooks.json](./hooks.json) — `sessionStart` injects `using-agent-skills`

## Usage in chat

- **Auto:** Agent picks skill from `description` when context matches
- **Command:** `/design`, `/build`, `/review`, …
- **Explicit:** `@design-workflow` or “Use skill design-workflow for …”
- **Entry:** [WORKFLOW.md](../WORKFLOW.md) · [AGENTS.md](../AGENTS.md)

## Maintenance

- New skill → `.cursor/skills/{name}/SKILL.md`, register in `skills/README.md` and `rules/00-workflow.mdc`
- New command → `.cursor/commands/{name}.md`
- New persona → `.cursor/agents/{name}.md`
