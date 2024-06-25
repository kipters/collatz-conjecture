FROM base AS build
COPY c /src
WORKDIR /src
RUN cc main.c -O3 -ffast-math -o main

FROM debian:bookworm
COPY --from=build /src/main /app/main
ENTRYPOINT [ "/app/main" ]
