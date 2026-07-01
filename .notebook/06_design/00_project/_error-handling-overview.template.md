# Error Handling Overview — {Project name}

**Last updated:** YYYY-MM-DD

## Principles

- User-facing vs system errors
- Retry policy
- Logging and alerting

## Categories

| Category | User message | Log level | Example |
|----------|--------------|-----------|---------|
| Validation | Yes | warn | Invalid input |
| Auth | Yes | warn | Session expired |
| System | Generic | error | DB unavailable |

## Related

- Screen-level messages: `02_screens/{id}/layout.md`
- API error codes: `04_integrations/{name}/api-document.md`
