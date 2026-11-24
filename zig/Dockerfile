FROM base AS build
ARG ZIG_VERSION=0.17.1
WORKDIR /tmp
RUN wget -O zig.tar.xz https://ziglang.org/download/${ZIG_VERSION}/zig-$(uname -m)-linux-${ZIG_VERSION}.tar.xz && \
    tar -xf zig.tar.xz && \
    mv zig-$(uname -m)-linux-${ZIG_VERSION} /zig
ENV PATH="/zig:${PATH}"
COPY zig /src
WORKDIR /src
RUN zig build-exe collatz.zig -O ReleaseSafe

FROM debian:trixie
COPY --from=build /src/collatz /app/collatz
ENTRYPOINT [ "/app/collatz" ]
