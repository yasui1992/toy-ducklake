ARG BASE_IMAGE=debian:bookworm-slim
ARG DUCKDB_VERSION=1.3.0
ARG USERNAME=nonoroot
ARG UID=1000
ARG GID=1000


FROM ${BASE_IMAGE} AS base
ARG USERNAME
ARG UID
ARG GID

RUN groupadd -g ${GID} ${USERNAME} \
 && useradd -ms /bin/sh -u ${UID} -g ${GID} ${USERNAME}
USER ${USERNAME}


FROM ${BASE_IMAGE} AS builder
ARG DUCKDB_VERSION

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    unzip \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/duckdb/bin \
 && curl -L -o /tmp/duckdb.zip https://github.com/duckdb/duckdb/releases/download/v${DUCKDB_VERSION}/duckdb_cli-linux-amd64.zip \
 && unzip /tmp/duckdb.zip -d /opt/duckdb/bin \
 && rm /tmp/duckdb.zip

COPY .duckdbrc /tmp/.duckdb


FROM base AS runtime
ARG USERNAME
ARG UID
ARG GID

COPY --from=builder /opt/duckdb/bin/duckdb /opt/duckdb/bin/duckdb
COPY --from=builder --chown=${UID}:${GID} /tmp/.duckdb /home/${USERNAME}/.duckdbrc

# Required for secure HTTPS communication with https://ui.duckdb.org
COPY --from=builder /etc/ssl/certs /etc/ssl/certs
COPY --from=builder /etc/ca-certificates.conf /etc/ca-certificates.conf
COPY --from=builder /usr/share/ca-certificates /usr/share/ca-certificates

ENV PATH=/opt/duckdb/bin:${PATH}

CMD [ "duckdb" ]
