require Integer
defmodule Prob2 do
  def run do
    Stream.unfold({1, 2}, fn {a, b} -> {a, {b, a + b}} end)
    |> Stream.take_while(&(&1 < 4_000_000))
    |> Stream.filter(&Integer.is_even/1)
    |> Enum.sum
    |> IO.puts
  end
end
