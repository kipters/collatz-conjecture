FROM scratch
COPY --from=c /app/main c/main
COPY --from=d /app/collatz d/collatz
COPY --from=dotnet /app dotnet/dist
COPY --from=dotnet-r2r /app dotnet/r2r
COPY --from=dotnet-aot /app dotnet/aot
COPY --from=fortran /app/collatz fortran/collatz
COPY --from=go /app/main go/main
COPY --from=java /app/collatz.jar java/collatz.jar
COPY --from=nim /app/collatz nim/collatz
COPY --from=rust /app/collatz rust/collatz
COPY --from=swift /app/collatz swift/collatz
COPY --from=v /app/collatz v/collatz
COPY --from=zig /app/collatz zig/collatz
