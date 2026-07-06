# Hooks

Project hooks in [hooks.json](../hooks.json). Scripts in [hooks/](./).

| Hook | Event | Purpose |
|------|-------|---------|
| [session-start.sh](./session-start.sh) | `sessionStart` | Inject `using-agent-skills` meta-skill context |

Requires `jq` on PATH for session-start. If missing, hook exits silently (skills still work individually).

Reload: save `hooks.json` or restart Cursor. Debug: Cursor **Hooks** output channel.

## Optional: SDD cache (advanced)

`agent-skills/hooks/sdd-cache-*.sh` targets Claude Code `WebFetch` — not wired here by default. For `source-driven-development` in Cursor, rely on live fetches or add a custom `preToolUse` hook when your harness exposes an equivalent fetch tool.
