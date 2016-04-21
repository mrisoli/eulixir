require Prime
defmodule Prob3 do
  def run do
    IO.puts Prime.Factor.list(600851475143) |> Enum.max
  end
end
