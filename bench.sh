#!/usr/bin/env bash

hyperfine --warmup 3 \
    'c/main' \
    'go/main' \
    'dotnet/dist/Collatz' \
    'dotnet/r2r/Collatz' \
    'dotnet/aot/Collatz' \
    'java -jar java/target/collatz-1.0-SNAPSHOT-jar-with-dependencies.jar' \
    'rust/collatz' \
    'node node/index.js' \
    'php php/collatz.php' \
    'php -dopcache.enable_cli=1 -dopcache.jit_buffer_size=100M php/collatz.php' \
    'ruby ruby/collatz.rb' \
    'elixir elixir/collatz.exs' \
    'swift/collatz' \
    'fortran/collatz' \
    'julia julia/collatz.jl' \
    'zig/collatz' \
    'nim/collatz' \
    'python3 python/collatz.py' \
