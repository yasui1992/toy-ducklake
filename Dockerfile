ARG BASE_IMAGE=debian:bookworm-slim
ARG DUCKDB_VERSION=1.3.0

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


FROM ${BASE_IMAGE} AS runtime
COPY --from=builder /opt/duckdb/bin/duckdb /opt/duckdb/bin/duckdb

ENV PATH=/opt/duckdb/bin:${PATH}

CMD [ "duckdb" ]
