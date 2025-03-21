FROM base AS build
WORKDIR /tmp
RUN git clone --branch=weekly.2025.12 --depth=1 https://github.com/vlang/v
WORKDIR /tmp/v
RUN make
RUN ./v symlink

COPY v /src
WORKDIR /src
RUN v -prod -o collatz collatz.v

FROM debian:bookworm
COPY --from=build /src/collatz /app/collatz
ENTRYPOINT [ "/app/collatz" ]
