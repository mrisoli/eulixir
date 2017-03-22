require Prime
require Integer
require Permutations
defmodule Prob35 do


  defp rotate(n) do
    Integer.digits(n)
    |> Permutations.rotate
    |> Enum.map(&Enum.join(&1, ""))
    |> Enum.map(&String.to_integer/1)
  end

  defp is_circular(n) do
    rotate(n)
    |> Enum.all?(&Prime.is_prime/1)
  end

  defp valid_digits?(n) when n == 2 or n == 5, do: true
  defp valid_digits?(n) do
    Integer.digits(n)
    |> Enum.all?(fn(x) -> (Integer.is_odd(x) and x != 5) end)
  end

  def run do
    Prime.up_to(1_000_000)
    |> Enum.filter(&valid_digits?/1)
    |> Enum.count(&is_circular/1)
    |> IO.puts
  end
end
