FROM python:3.13-slim-trixie  AS base

WORKDIR /app

FROM base AS builder

COPY --from=ghcr.io/astral-sh/uv:0.8 /uv /bin/uv

COPY . /app
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-install-project --no-dev

FROM base AS runner

RUN groupadd -r user && useradd -r user -g user
RUN chown -R user:user /app

COPY --from=builder --chown=user:user /app /app

USER user

ENV PATH="/app/.venv/bin:$PATH"

EXPOSE 8000

CMD [ "fastapi", "run" ]