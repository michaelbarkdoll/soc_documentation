"""Stream tokens from the SIU AI LiteLLM gateway as they arrive."""

from __future__ import annotations

import os
import sys
from openai import OpenAI


def required_env(name: str) -> str:
    value = os.getenv(name)
    if not value:
        raise RuntimeError(f"Set {name} before running this program.")
    return value


def main() -> int:
    try:
        client = OpenAI(
            base_url=os.getenv("SIU_AI_BASE_URL", "https://api.cs.siu.edu/v1"),
            api_key=required_env("SIU_AI_KEY"),
            timeout=120.0,
        )
        stream = client.chat.completions.create(
            model=required_env("SIU_AI_MODEL"),
            messages=[
                {"role": "user", "content": "Give me five practical Git debugging tips."}
            ],
            temperature=0.2,
            stream=True,
        )
        for event in stream:
            text = event.choices[0].delta.content
            if text:
                print(text, end="", flush=True)
        print()
        return 0
    except Exception as exc:  # Keep the sample friendly at the command line.
        print(f"Request failed: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
