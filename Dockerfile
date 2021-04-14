FROM elixir:1.11.4

COPY ./app /app

RUN mix local.hex

WORKDIR /app
