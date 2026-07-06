# Agent harness (develop phase)

Develop-phase skills and references — separate from `.cursor/` project skills.

## Layout

| Path | Purpose |
|------|---------|
| [references/](./references/) | Pointer to [.notebook/00_references/](../.notebook/00_references/README.md) — DoD, checklists |
| [vendor/](./vendor/) | Optional clones of upstream skill libraries |

## Project skills vs vendor

| Layer | Location | When |
|-------|----------|------|
| **Project** | `.cursor/skills/` | Define, Plan, Design, Report — always |
| **Vendor** | `.agent/vendor/` | TDD, review, debug — after stack is chosen |

## Related

- [WORKFLOW.md](../WORKFLOW.md) · [.workflow-sldc/01_WORKFLOW.md](../.workflow-sldc/01_WORKFLOW.md)
- [.cursor/skills/README.md](../.cursor/skills/README.md)
- [.cursor/agents/README.md](../.cursor/agents/README.md) — review personas
- [.cursor/commands/README.md](../.cursor/commands/README.md) — slash commands
