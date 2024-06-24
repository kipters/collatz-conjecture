-- Function to compute the Collatz sequence for a given seed
function collatz(seed)
    local steps = 0
    while seed > 1 do
        if seed % 2 == 0 then
            seed = seed // 2  -- Integer division
        else
            seed = seed * 3 + 1
        end
        steps = steps + 1
    end
    return steps
end

-- Main function to accumulate the total number of steps
function main()
    local collatzResult = 0
    for seed = 1, 1000000 do
        collatzResult = collatzResult + collatz(seed)
    end
    print("steps " .. collatzResult)
end

-- Execute the main function
main()
