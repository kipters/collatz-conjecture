FROM base AS build
ARG ZIG_VERSION=0.13.0
WORKDIR /tmp
RUN wget -O zig.tar.xz https://ziglang.org/download/${ZIG_VERSION}/zig-linux-$(uname -m)-${ZIG_VERSION}.tar.xz && \
    tar -xf zig.tar.xz && \
    mv zig-linux-$(uname -m)-${ZIG_VERSION} /zig
ENV PATH="/zig:${PATH}"
COPY zig /src
WORKDIR /src
RUN zig build-exe collatz.zig -O ReleaseSafe

FROM debian:bookworm
COPY --from=build /src/collatz /app/collatz
ENTRYPOINT [ "/app/collatz" ]
