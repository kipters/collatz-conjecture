import math

proc collatz(seed: int): int =
    var steps = 0
    var tempSeed = seed
    while tempSeed > 1:
        if tempSeed mod 2 == 0:
            tempSeed = tempSeed div 2
        else:
            tempSeed = tempSeed * 3 + 1
        inc(steps)
    return steps

proc main() =
    var collatzResult = 0
    for seed in 1..1_000_000:
        collatzResult += collatz(seed)
    
    echo "steps ", collatzResult

main()
