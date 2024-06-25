FROM nimlang/nim:2.0.6 AS build
COPY nim /src
WORKDIR /src
RUN nim compile -d:release -o:collatz collatz.nim

FROM debian:bookworm
COPY --from=build /src/collatz /app/collatz
ENTRYPOINT [ "/app/collatz" ]
