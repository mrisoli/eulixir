require Prime
defmodule Prob27 do

  def formula(a,b,x), do: (x * x) + ( a * x) + b
  def primes_for(a,b) do
    0..b-1
    |> Enum.take_while(fn(x) -> Prime.is_prime(formula(a,b,x)) end )
    |> Enum.count
  end

  def best_value_of_b_for(a) do
    Enum.map(-999..999, fn(b) -> {a * b, primes_for(a,b)} end)
    |> Enum.max_by(fn {_, v} -> v end)
  end

  def run do
    -999..999
    |> Enum.map(&(best_value_of_b_for(&1)))
    |> Enum.max_by(fn {_, v} -> v end)
    |> elem(0)
    |> IO.puts
  end
end
