defmodule Prob48 do
  def run do
    1..1_000
    |> Enum.reduce(fn(n, acc) -> acc + Numbers.pow(n, n) end)
    |> rem(10_000_000_000)
    |> IO.puts
  end
end
