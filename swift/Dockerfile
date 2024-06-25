FROM swift:5.10-bookworm AS build
COPY swift /src
WORKDIR /src
RUN swiftc -O collatz.swift -o collatz

FROM debian:bookworm
COPY --from=build /src/collatz /app/collatz
ENTRYPOINT [ "/app/collatz" ]