FROM base AS build
RUN apt-get -y install gdc
COPY d /src
WORKDIR /src
RUN gdc -O3 -funroll-loops -finline-functions -static-libphobos -o collatz collatz.d

FROM debian:bookworm
COPY --from=build /src/collatz /app/collatz
ENTRYPOINT [ "/app/collatz" ]
