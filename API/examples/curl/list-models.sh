#!/usr/bin/env bash
set -euo pipefail

: "${SIU_AI_KEY:?Set SIU_AI_KEY before running this script.}"
SIU_AI_BASE_URL="${SIU_AI_BASE_URL:-https://api.cs.siu.edu/v1}"

curl --fail-with-body --silent --show-error \
  "${SIU_AI_BASE_URL}/models" \
  --header "Authorization: Bearer ${SIU_AI_KEY}" \
  --header "Accept: application/json"
printf '\n'
