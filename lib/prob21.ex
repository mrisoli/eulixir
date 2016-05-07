defmodule Prob21 do
  defp amicable?(n) do
    d = divisors_sum(n)
    (n == divisors_sum(d)) and (n != d)
  end
  defp divisors_sum(n) when n > 1 do
    (1..(n - 1))
    |> Enum.filter(&(rem(n,&1) == 0))
    |> Enum.sum
  end
  defp divisors_sum(n) when n <= 1, do: 0

  def run do
    1..10_000
    |> Enum.filter( &(amicable?(&1)))
    |> Enum.sum
    |> IO.puts
  end
end
