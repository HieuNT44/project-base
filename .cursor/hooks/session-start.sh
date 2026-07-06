#!/bin/bash
# project-base session start hook — inject using-agent-skills meta-skill

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
META_SKILL="$(dirname "$SCRIPT_DIR")/skills/using-agent-skills/SKILL.md"

if [ ! -f "$META_SKILL" ]; then
  exit 0
fi

if ! command -v jq >/dev/null 2>&1; then
  exit 0
fi

CONTENT=$(cat "$META_SKILL")
jq -cn \
  --arg ctx "project-base loaded. Follow WORKFLOW.md and skill discovery:

$CONTENT" \
  '{ "additional_context": $ctx }'
