function collatz(seed) {
    let steps = 0;
    while (seed > 1) {
        while (seed % 2 === 0) {
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

function main() {
    let collatzResult = 0;
    for (let seed = 1; seed <= 1000000; seed++) {
        collatzResult += collatz(seed);
    }
    console.log(`steps ${collatzResult}`);
}

main();
