require Permutations
defmodule Prob24 do
  def run do
    Permutations.permute([0,1,2,3,4,5,6,7,8,9])
    |> Enum.at(999_999)
    |> Enum.join("")
    |> IO.puts
  end
end
