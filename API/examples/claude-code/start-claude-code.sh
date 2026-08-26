#!/usr/bin/env bash
set -euo pipefail

: "${SIU_AI_KEY:?Set SIU_AI_KEY before running this script.}"
: "${SIU_AI_MODEL:?Set SIU_AI_MODEL to an ID returned by /v1/models.}"

# Claude Code appends /v1/messages, so use the gateway root without /v1.
export ANTHROPIC_BASE_URL="https://api.cs.siu.edu"
export ANTHROPIC_AUTH_TOKEN="${SIU_AI_KEY}"
export ANTHROPIC_MODEL="${SIU_AI_MODEL}"
export ANTHROPIC_DEFAULT_MODEL="${SIU_AI_MODEL}"
export ANTHROPIC_DEFAULT_FABLE_MODEL="${SIU_AI_MODEL}"
export ANTHROPIC_DEFAULT_OPUS_MODEL="${SIU_AI_MODEL}"
export ANTHROPIC_DEFAULT_SONNET_MODEL="${SIU_AI_MODEL}"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="${SIU_AI_MODEL}"
export CLAUDE_CODE_SUBAGENT_MODEL="${SIU_AI_MODEL}"
export CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY=1
export CLAUDE_CODE_MAX_CONTEXT_TOKENS=32768
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=4096
export CLAUDE_CODE_EFFORT_LEVEL=medium

exec claude --model "${SIU_AI_MODEL}" "$@"
