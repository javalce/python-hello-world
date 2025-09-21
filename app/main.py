from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()


class Message(BaseModel):
    message: str


@app.get("/")
async def read_root() -> Message:
    return Message(message="Hello, World!")
