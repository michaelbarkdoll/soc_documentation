"""A minimal one-node LangGraph backed by the SIU AI gateway."""

from __future__ import annotations

import os
from typing_extensions import TypedDict
from langchain_openai import ChatOpenAI
from langgraph.graph import END, START, StateGraph


class State(TypedDict):
    question: str
    answer: str


def required_env(name: str) -> str:
    value = os.getenv(name)
    if not value:
        raise RuntimeError(f"Set {name} before running this program.")
    return value


llm = ChatOpenAI(
    base_url=os.getenv("SIU_AI_BASE_URL", "https://api.cs.siu.edu/v1"),
    api_key=required_env("SIU_AI_KEY"),
    model=required_env("SIU_AI_MODEL"),
    temperature=0.2,
    timeout=120,
)


def answer_question(state: State) -> State:
    reply = llm.invoke(state["question"])
    return {"question": state["question"], "answer": str(reply.content)}


builder = StateGraph(State)
builder.add_node("answer", answer_question)
builder.add_edge(START, "answer")
builder.add_edge("answer", END)
graph = builder.compile()

result = graph.invoke({"question": "What problem does a database index solve?", "answer": ""})
print(result["answer"])
