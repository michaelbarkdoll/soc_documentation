#!/usr/bin/env bash
set -euo pipefail

: "${SIU_AI_KEY:?Set SIU_AI_KEY before running this script.}"
: "${SIU_AI_MODEL:?Set SIU_AI_MODEL to an ID returned by /v1/models.}"
SIU_AI_BASE_URL="${SIU_AI_BASE_URL:-https://api.cs.siu.edu/v1}"

curl --fail-with-body --silent --show-error \
  "${SIU_AI_BASE_URL}/chat/completions" \
  --header "Authorization: Bearer ${SIU_AI_KEY}" \
  --header "Content-Type: application/json" \
  --data "$(cat <<JSON
{
  "model": "${SIU_AI_MODEL}",
  "messages": [
    {
      "role": "system",
      "content": "You are a concise and careful programming assistant."
    },
    {
      "role": "user",
      "content": "Write a Python function that checks whether a string is a palindrome."
    }
  ],
  "temperature": 0.2,
  "stream": false
}
JSON
)"
printf '\n'
