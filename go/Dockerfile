FROM golang:1.27.4 AS build
COPY go /src
WORKDIR /src
RUN go build -o main main.go

FROM debian:trixie
COPY --from=build /src/main /app/main
ENTRYPOINT [ "/app/main" ]
