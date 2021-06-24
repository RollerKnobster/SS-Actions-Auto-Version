FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7

# DISABLE pip cache and version check, increase the timeout, set some
# useful Python flags.
ENV PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1

ENV PYTHON_PIP_VERSION=21.1.2 \
    POETRY_VERSION=1.1.6 \
    POETRY_VIRTUALENVS_CREATE=false

# Use poetry for dependencies management.
RUN pip install "pip==$PYTHON_PIP_VERSION" "poetry==$POETRY_VERSION"

# Copy only poetry-specific files to collect the dependencies.
WORKDIR /app
COPY poetry.lock pyproject.toml /app/

# Install dependencies
RUN poetry install --no-dev --no-interaction --no-ansi --no-root

# Non-root user for running the application
RUN groupadd -g 1000 app && \
    useradd -r -u 1000 -g app app


# Custom home for easier interactions inside container
ENV HOME "/app"

# Copy the app code to the place expected by the runner
# and make app user own everything in the directory.
COPY ./app /app/app/
RUN chown -R app:app /app/

# Switch user
USER 1000

ENV PORT 8000