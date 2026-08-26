$ErrorActionPreference = "Stop"

if (-not $env:SIU_AI_KEY) {
    throw "Set SIU_AI_KEY before running this script."
}
if (-not $env:SIU_AI_MODEL) {
    throw "Set SIU_AI_MODEL to an ID returned by /v1/models."
}

$env:ANTHROPIC_BASE_URL = "https://api.cs.siu.edu"
$env:ANTHROPIC_AUTH_TOKEN = $env:SIU_AI_KEY
$env:ANTHROPIC_MODEL = $env:SIU_AI_MODEL
$env:ANTHROPIC_DEFAULT_MODEL = $env:SIU_AI_MODEL
$env:ANTHROPIC_DEFAULT_FABLE_MODEL = $env:SIU_AI_MODEL
$env:ANTHROPIC_DEFAULT_OPUS_MODEL = $env:SIU_AI_MODEL
$env:ANTHROPIC_DEFAULT_SONNET_MODEL = $env:SIU_AI_MODEL
$env:ANTHROPIC_DEFAULT_HAIKU_MODEL = $env:SIU_AI_MODEL
$env:CLAUDE_CODE_SUBAGENT_MODEL = $env:SIU_AI_MODEL
$env:CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY = "1"
$env:CLAUDE_CODE_MAX_CONTEXT_TOKENS = "32768"
$env:CLAUDE_CODE_MAX_OUTPUT_TOKENS = "4096"
$env:CLAUDE_CODE_EFFORT_LEVEL = "medium"

& claude --model $env:SIU_AI_MODEL @args
