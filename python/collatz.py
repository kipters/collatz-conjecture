def collatz(seed):
    steps = 0
    while seed > 1:
        while seed % 2 == 0:
            steps += 1
            seed //= 2
        if seed > 1:
            steps += 1
            seed = 3 * seed + 1
    return steps

def main():
    collatz_result = 0
    for seed in range(1, 1_000_000 + 1):
        collatz_result += collatz(seed)
    print(f"steps {collatz_result}")

if __name__ == "__main__":
    main()
