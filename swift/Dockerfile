FROM swift:6.4.3-trixie AS build
RUN apt-get update && apt-get -y install clang
COPY swift /src
WORKDIR /src
RUN swiftc -static-stdlib -O collatz.swift -o collatz

FROM debian:trixie
COPY --from=build /src/collatz /app/collatz
ENTRYPOINT [ "/app/collatz" ]