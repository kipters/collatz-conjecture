package dev.kipters;

public class App {
  public static void main(String[] args) {
    long collatzResult = 0;
    for (long seed = 1; seed <= 1_000_000; seed++) {
      collatzResult += collatz(seed);
    }
    System.out.println("steps: " + collatzResult);
  }

  public static long collatz(long seed) {
    long steps = 0;
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
}
