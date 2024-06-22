import Foundation

func collatz(_ seed: Int) -> Int {
    var seed = seed
    var steps = 0
    while seed > 1 {
        while seed % 2 == 0 {
            steps += 1
            seed /= 2
        }
        if seed > 1 {
            steps += 1
            seed = seed * 3 + 1
        }
    }
    return steps
}

func main() {
    var collatzResult = 0
    for seed in 1...1_000_000 {
        collatzResult += collatz(seed)
    }
    print("steps \(collatzResult)")
}

main()
