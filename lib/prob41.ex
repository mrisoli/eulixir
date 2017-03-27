require Permutations
require Prime
defmodule Prob41 do

  defp gen_numbers(n) do
    1..n
    |> Enum.to_list
    |> Permutations.digits
    |> Enum.filter(&Prime.is_prime/1)
    |> Enum.max(fn -> 0 end)
  end

  def run do
    5..9
    |> Enum.map(&gen_numbers/1)
    |> Enum.max
    |> IO.puts
  end
end
