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


@router.get("/name/{specific_name}", include_in_schema=False)
def specific_name():
    """Have a more specific way to provide a name to be greeted for."""
    return PlainTextResponse(f'Hello, specific {specific_name}!')
