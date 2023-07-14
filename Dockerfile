FROM rust:alpine
ENV XDG_CONFIG_HOME /github/workspace
ENV WRANGLER_HOME /github/workspace

RUN apk update && \
    apk upgrade

RUN apk add --no-cache nodejs npm bash musl-dev

RUN rustup target add wasm32-unknown-unknown

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
