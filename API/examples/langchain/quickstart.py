"""Call the SIU AI gateway through LangChain's OpenAI-compatible client."""

from __future__ import annotations

import os
from langchain_openai import ChatOpenAI


def required_env(name: str) -> str:
    value = os.getenv(name)
    if not value:
        raise RuntimeError(f"Set {name} before running this program.")
    return value


model = ChatOpenAI(
    base_url=os.getenv("SIU_AI_BASE_URL", "https://api.cs.siu.edu/v1"),
    api_key=required_env("SIU_AI_KEY"),
    model=required_env("SIU_AI_MODEL"),
    temperature=0.2,
    timeout=120,
    max_retries=2,
)

response = model.invoke(
    "Explain the difference between a process and a thread in four bullet points."
)
print(response.content)
