FROM perconalab/percona-postgresql-operator:main-ppg12-postgres

LABEL org.opencontainers.image.source="https://github.com/andreyelpaev/percona-pg-wal"

ENV WALG_VERSION=v3.0.0

USER root

RUN microdnf update && \
    microdnf install wget cmake git golang vim && \
    git clone https://github.com/wal-g/wal-g/ wal-g-build && \
    cd wal-g-build && \
    git checkout $WALG_VERSION && \
    export USE_BROTLI=1 && \
    make install && \
    make deps && \
    make pg_build && \
    install main/pg/wal-g / && \
    mv /wal-g /usr/bin

USER 26