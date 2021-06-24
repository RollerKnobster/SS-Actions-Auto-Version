from fastapi import APIRouter
from starlette.responses import PlainTextResponse

router = APIRouter()


@router.get("/", include_in_schema=False)
def home():
    """Main endpoint."""
    return PlainTextResponse('Hello world!')


@router.get("/{name}", include_in_schema=False)
def name():
    """Optional name endpoint."""
    return PlainTextResponse(f'Hello {name}!')
