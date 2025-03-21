ARG DOTNET_VERSION=9.0
FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_VERSION}-bookworm-slim AS build
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install build-essential zlib1g-dev
COPY dotnet /src
WORKDIR /src
RUN dotnet publish -o /app/dist
RUN dotnet publish -o /app/aot -p:PublishAot=true
RUN dotnet publish -o /app/r2r -p:PublishReadyToRun=true

FROM mcr.microsoft.com/dotnet/runtime:${DOTNET_VERSION}-bookworm-slim AS runtime
COPY --from=build /app/dist /app
ENTRYPOINT [ "/app/Collatz" ]

FROM mcr.microsoft.com/dotnet/runtime-deps:${DOTNET_VERSION}-bookworm-slim AS aot
COPY --from=build /app/aot /app
ENTRYPOINT [ "/app/Collatz" ]

FROM mcr.microsoft.com/dotnet/runtime:${DOTNET_VERSION}-bookworm-slim AS r2r
COPY --from=build /app/r2r /app
ENTRYPOINT [ "/app/Collatz" ]