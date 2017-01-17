require Palindrome
defmodule Prob4 do
  def run do
    100..999
    |> Stream.flat_map(fn(x) -> Enum.map(100..999, &(&1*x)) end)
    |> Stream.filter(fn(x) -> Palindrome.number?(x) end)
    |> Enum.max
    |> IO.puts
  end
end
