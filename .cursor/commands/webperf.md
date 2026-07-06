# Webperf — audit hiệu năng web

Adopt **[web-performance-auditor](../agents/web-performance-auditor.md)** persona. Invoke **`performance-optimization`** skill for fixes.

1. **Quick mode** (default): source scan — tag findings as `potential impact`, scorecard `not measured`
2. **Deep mode**: when Lighthouse/CrUX/DevTools artifacts or MCP available — label each metric with source

Never fabricate LCP/INP/CLS without tool data.

Baseline: [.notebook/00_references/performance-checklist.md](../../.notebook/00_references/performance-checklist.md)

For browser capture: **`browser-testing-with-devtools`** skill.
