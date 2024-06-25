#!/usr/bin/env bash
cc c/main.c -O3 -ffast-math -o c/main
dotnet publish dotnet/Collatz.csproj -o dotnet/dist
dotnet publish dotnet/Collatz.csproj -o dotnet/r2r -p:PublishReadyToRun=true
dotnet publish dotnet/Collatz.csproj -o dotnet/aot -p:PublishAot=true
go build -o go/main go/main.go
rustc -C opt-level=3 -C target-cpu=native -C lto -C codegen-units=1 -C debuginfo=0 -C incremental=off -C overflow-checks=off -C panic=abort -C target-feature=+crt-static -o rust/collatz rust/collatz.rs
swiftc -O swift/collatz.swift -o swift/collatz
gfortran -O3 fortran/collatz.f90 -o fortran/collatz
nim compile -d:release -o:nim/collatz nim/collatz.nim
gdc -O3 -funroll-loops -finline-functions -o d/collatz d/collatz.d
v -prod -o v/collatz v/collatz.v

cd java
mvn clean compile assembly:single
cp target/collatz-1.0-SNAPSHOT-jar-with-dependencies.jar ../java/collatz.jar
cd ..

cd zig
zig build-exe collatz.zig -O ReleaseSafe
rm collatz.o
cd ..
