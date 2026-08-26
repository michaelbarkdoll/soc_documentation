# UI-based client settings reference

Use these values in clients that are configured through a settings screen rather than a file.

| Client | Provider selection | Base URL | Key field | Model field | Token limits |
|---|---|---|---|---|---|
| Cline | OpenAI Compatible | `https://api.cs.siu.edu/v1` | Assigned SIU AI key | ID from `GET /v1/models` | Context `32768`; output `4096` |
| Kilo Code | Custom → OpenAI Compatible | `https://api.cs.siu.edu/v1` | Assigned SIU AI key | Select discovered Qwen model | Context `32768`; output `4096` |
| Roo Code | LiteLLM (recommended) | `https://api.cs.siu.edu` | Assigned SIU AI key | Select discovered Qwen model | Verify context `32768`; output `4096` |

Keep automatic command approval disabled until you have reviewed what the coding agent plans to run.
