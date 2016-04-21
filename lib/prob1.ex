defmodule Prob1 do
  def run do
    IO.puts Enum.filter((3..999), fn(x) -> rem(x, 3) == 0 or rem(x, 5) == 0 end) |> Enum.sum
  end
end
