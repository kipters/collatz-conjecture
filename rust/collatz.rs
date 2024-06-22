fn collatz(mut seed: i64) -> i64 {
    let mut steps = 0;
    while seed > 1 {
        while seed % 2 == 0 {
            steps += 1;
            seed /= 2;
        }
        if seed > 1 {
            steps += 1;
            seed = seed * 3 + 1;
        }
    }
    steps
}

fn main() {
    let mut collatz_result = 0;
    for seed in 1..=1_000_000 {
        collatz_result += collatz(seed);
    }
    println!("steps {}", collatz_result);
}
