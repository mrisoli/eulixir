require Permutations
defmodule Prob43 do

  defp get_num(arr, slice) do
    Enum.slice(arr, slice, 3)
    |> Enum.join("")
    |> String.to_integer
  end

  defp is_divisable?(n, 17, 7), do: rem(get_num(n, 7), 17) == 0
  defp is_divisable?(n, divisor, i) do
    rem(get_num(n, i), divisor) == 0 and is_divisable?(n, List.last(Prime.take(i + 1)), i + 1)
  end

  def run do
    0..9
    |> Enum.to_list
    |> Permutations.permute
    |> Enum.filter(&is_divisable?(&1, List.last(Prime.take(1)), 1))
    |> Enum.map(fn(x) -> Enum.join(x, "") |> String.to_integer end)
    |> Enum.sum
    |> IO.puts
  end
end
