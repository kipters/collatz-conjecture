long totalSteps = 0;
for (var seed = 1; seed <= 1_000_000; seed++)
{
    totalSteps += collatz(seed);
}

Console.WriteLine($"steps: {totalSteps}");

static long collatz(long seed)
{
    var steps = 0;
    while (seed > 1)
    {
        while (seed % 2 == 0)
        {
            steps++;
            seed /= 2;
        }
        if (seed > 1)
        {
            steps++;
            seed = seed * 3 + 1;
        }
    }
    return steps;
}
