require Integer
defmodule Prob28 do
  defp find_corners_sum(1), do: 1
  defp find_corners_sum(n), do: ((4 * n * n) - (6 * n) + 6)
  def run do
    1..1001
    |> Enum.filter(&Integer.is_odd/1)
    |> Enum.map(fn(x) -> find_corners_sum(x) end)
    |> Enum.sum
    |> IO.puts
  end
end
