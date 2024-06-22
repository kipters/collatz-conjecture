defmodule Collatz do
  def collatz(seed) do
    collatz(seed, 0)
  end

  defp collatz(1, steps), do: steps

  defp collatz(seed, steps) when rem(seed, 2) == 0 do
    collatz(div(seed, 2), steps + 1)
  end

  defp collatz(seed, steps) do
    collatz(seed * 3 + 1, steps + 1)
  end
end

defmodule Main do
  def run do
    collatz_result = Enum.reduce(1..1_000_000, 0, fn seed, acc ->
      acc + Collatz.collatz(seed)
    end)
    IO.puts("steps #{collatz_result}")
  end
end

Main.run()
