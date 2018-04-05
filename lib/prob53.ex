require Factorial
defmodule Prob53 do
  def run do
    23..100
    |> Enum.map(&over_million_combinations/1)
    |> Enum.sum
    |> IO.puts
  end

  defp over_million_combinations(n) do
    0..n
    |> Enum.map(fn r -> combination_of(n, r) end)
    |> Enum.count(fn x -> x > 1_000_000 end)
  end

  defp combination_of(n, r) do
    diff = n - r
    div(Factorial.of(n), (Factorial.of(r) * Factorial.of(n - r)))
  end
end
