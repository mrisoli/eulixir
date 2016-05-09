defmodule Prob23 do
  def abundant?(n) do
    n < 1..n-1 |> Enum.filter( &(rem(n, &1) == 0)) |> Enum.sum
  end
  def run do
    abundants = 12..28_111 |> Enum.filter( &(abundant?(&1)))
    sums = Enum.flat_map(abundants, fn(x) -> Enum.map(abundants, &( &1 + x)) end)
    1..28_123 |> Enum.filter( &(!Enum.member?(sums, &1))) |> Enum.sum
    |> IO.puts
  end
end
