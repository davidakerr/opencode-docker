FROM debian:bookworm-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    gnupg \
    procps \
    python3 \
    python3-pip \
    tini \
    unzip \
    xz-utils \
  && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash - \
  && apt-get install -y --no-install-recommends nodejs \
  && node -v \
  && npm -v \
  && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN curl -fsSL https://bun.com/install | bash \
  && /root/.bun/bin/bun --version \
  && /root/.bun/bin/bunx --version

RUN curl -fsSL https://opencode.ai/install | bash

RUN install -m 0755 /root/.opencode/bin/opencode /usr/local/bin/opencode \
  && opencode --version

RUN npm install -g oh-my-opencode@latest \
  && command -v oh-my-opencode \
  && oh-my-opencode --version

RUN mkdir -p /projects /root/.config /root/.local/share /root/.cache /root/.config/opencode

WORKDIR /root

EXPOSE 8080

ENTRYPOINT ["/usr/bin/tini", "--", "code-server"]
CMD ["--bind-addr", "0.0.0.0:8080", "--auth", "none", "/projects"]
