FROM node:16
ENV XDG_CONFIG_HOME /github/workspace
ENV WRANGLER_HOME /github/workspace

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN . "$HOME/.cargo/env"
RUN rustup target add wasm32-unknown-unknown

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
