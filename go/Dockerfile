FROM golang:1.22 AS build
COPY go /src
WORKDIR /src
RUN go build -o main main.go

FROM debian:bookworm
COPY --from=build /src/main /app/main
ENTRYPOINT [ "/app/main" ]
