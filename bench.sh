#!/usr/bin/env bash

hyperfine --warmup 3 \
    'c/main' \
    'go/main' \
    'dotnet/dist/Collatz' \
    'dotnet/r2r/Collatz' \
    'dotnet/aot/Collatz' \
    'java -jar java/collatz.jar' \
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
    'lua lua/collatz.lua' \
    'd/collatz' \
    'bun node/index.js' \
    'perl perl/collatz.pl' \
    'v/collatz' \
    'python3 python/collatz.py' \
