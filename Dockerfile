FROM elixir:1.11.4

WORKDIR /workspaces

COPY ./app /workspaces

RUN mix local.hex
