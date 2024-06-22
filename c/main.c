#include <stdio.h>
#include <stdint.h>

uint64_t collatz(uint64_t seed) {
    uint64_t steps = 0;
    while (seed > 1) {
        while (seed % 2 == 0) {
            steps++;
            seed /= 2;
        }
        if (seed > 1) {
            steps++;
            seed = seed * 3 + 1;
        }
    }
    return steps;
}

int main() {
    uint64_t totalSteps = 0;
    for (int seed = 1; seed <= 1000000; seed++) {
        totalSteps += collatz(seed);
    }
    printf("steps: %ld\n", totalSteps);
    return 0;
}
