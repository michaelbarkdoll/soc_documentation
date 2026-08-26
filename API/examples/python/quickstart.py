"""Minimal non-streaming request to the SIU AI LiteLLM gateway."""

from __future__ import annotations

import os
import sys
from openai import APIConnectionError, APIStatusError, OpenAI


def required_env(name: str) -> str:
    value = os.getenv(name)
    if not value:
        raise RuntimeError(f"Set the {name} environment variable before running this program.")
    return value


def main() -> int:
    try:
        client = OpenAI(
            base_url=os.getenv("SIU_AI_BASE_URL", "https://api.cs.siu.edu/v1"),
            api_key=required_env("SIU_AI_KEY"),
            timeout=120.0,
            max_retries=2,
        )
        response = client.chat.completions.create(
            model=required_env("SIU_AI_MODEL"),
            messages=[
                {
                    "role": "system",
                    "content": "You are a careful programming tutor. Explain rather than merely answer.",
                },
                {
                    "role": "user",
                    "content": "Explain Python list comprehensions with one short example.",
                },
            ],
            temperature=0.2,
        )
        print(response.choices[0].message.content or "")
        return 0
    except APIStatusError as exc:
        print(f"The gateway returned HTTP {exc.status_code}: {exc.response.text}", file=sys.stderr)
    except APIConnectionError as exc:
        print(f"Could not reach the SIU AI gateway: {exc}", file=sys.stderr)
    except (RuntimeError, KeyError) as exc:
        print(str(exc), file=sys.stderr)
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
