package main

import (
    "fmt"
)

func collatz(seed int64) int64 {
    var steps int64 = 0
    for seed > 1 {
        for seed%2 == 0 {
	    steps++
	    seed /= 2
        }
        if seed > 1 {
            steps++
            seed = seed*3 + 1
        }
    }
    return steps
}

func main() {
    var collatzResult int64 = 0
    for seed := 1; seed <= 1_000_000; seed++ {
        collatzResult += collatz(int64(seed))
    }
    fmt.Printf("steps %d\n", collatzResult)
}
