# FROM nimlang/nim:2.0.10 AS build
# COPY nim /src
# WORKDIR /src
# RUN nim compile -d:release -o:collatz collatz.nim

FROM debian:bookworm AS build
ARG NIM_VERSION=2.2.2
RUN apt-get update && apt-get install -y build-essential curl git
RUN curl -sSLo /tmp/nim.tar.xz https://nim-lang.org/download/nim-${NIM_VERSION}.tar.xz && \
    mkdir -p /tmp/nim && \
    tar -xf /tmp/nim.tar.xz -C /tmp/nim && \
    cd /tmp/nim/nim-${NIM_VERSION} && \
    sh ./build.sh && \
    ./bin/nim c koch && \
    ./koch boot -d:release && \
    ./koch tools
ENV PATH="/tmp/nim/nim-${NIM_VERSION}/bin:/root/.nimble/bin:$PATH"
COPY nim /src
WORKDIR /src
RUN nim compile -d:release -o:collatz collatz.nim

FROM debian:bookworm
COPY --from=build /src/collatz /app/collatz
ENTRYPOINT [ "/app/collatz" ]
