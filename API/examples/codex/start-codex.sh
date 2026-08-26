#!/usr/bin/env bash
set -euo pipefail

: "${SIU_AI_KEY:?Set SIU_AI_KEY before running this script.}"
exec codex "$@"
