defmodule Prob6 do
  def run do
    square = 1..100 |> Enum.sum |> :math.pow(2)
    sum = 1..100 |> Enum.reduce(fn(x, acc) -> :math.pow(x,2) + acc end)
    IO.puts square - sum
  end
end
