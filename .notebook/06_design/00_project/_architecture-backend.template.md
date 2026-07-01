# Architecture Design (Backend) — {Project name}

**Last updated:** YYYY-MM-DD

## Stack (TBD per project)

| Layer | Choice | Notes |
|-------|--------|-------|
| Runtime | TBD | e.g. Node, Java, Salesforce Platform |
| API style | TBD | REST, GraphQL, … |
| Database | TBD | |
| Async / jobs | TBD | |

## Module structure

```
backend/
└── …
```

## Cross-cutting concerns

- AuthN / AuthZ (see [permission-design](./permission-design.md))
- Logging / observability
- Integration (see [integration-overview](./integration-overview.md))

## Related

- [Architecture Frontend](./architecture-frontend.md)
