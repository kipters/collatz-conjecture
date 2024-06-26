FROM swift:5.10-bookworm AS build
RUN apt-get update && apt-get -y install clang
COPY swift /src
WORKDIR /src
RUN swiftc -static-stdlib -O collatz.swift -o collatz

FROM debian:bookworm
COPY --from=build /src/collatz /app/collatz
ENTRYPOINT [ "/app/collatz" ]