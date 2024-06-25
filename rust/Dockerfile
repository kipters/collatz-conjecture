FROM rust:1.79-bookworm AS build
COPY rust /src
WORKDIR /src
RUN rustc -C opt-level=3 \
    -C target-cpu=native \
    -C lto \
    -C codegen-units=1 \
    -C debuginfo=0 \
    -C incremental=off \
    -C overflow-checks=off \
    -C panic=abort \
    -C target-feature=+crt-static \
    -o collatz \
    collatz.rs

FROM debian:bookworm
COPY --from=build /src/collatz /app/collatz
ENTRYPOINT [ "/app/collatz" ]
