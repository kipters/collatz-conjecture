function collatz(seed)
    steps = 0
    while seed > 1
        while seed % 2 == 0
            steps += 1
            seed ÷= 2
        end
        if seed > 1
            steps += 1
            seed = seed * 3 + 1
        end
    end
    return steps
end

function main()
    collatz_result = 0
    for seed in 1:1_000_000
        collatz_result += collatz(seed)
    end
    println("steps $collatz_result")
end

main()
