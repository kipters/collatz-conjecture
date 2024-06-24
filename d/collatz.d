import std.stdio;

long collatz(long seed) {
    long steps = 0;
    while (seed > 1) {
        if (seed % 2 == 0) {
            seed /= 2;
        } else {
            seed = seed * 3 + 1;
        }
        ++steps;
    }
    return steps;
}

void main() {
    long collatzResult = 0;
    foreach (long seed; 1L .. 1_000_000L + 1L) {
        collatzResult += collatz(seed);
    }
    writeln("steps ", collatzResult);
}
