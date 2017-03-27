defmodule Prob39 do

  defp solutions(p, a) do
    3..div(p, 3)
    |> Enum.filter(fn(b) -> (a + b + :math.sqrt((a * a) + (b * b)) == p) end)
    |> Enum.count
  end

  defp num_solutions(p) do
    4..div(p, 2)
    |> Enum.map(&(solutions(p, &1)))
    |> Enum.sum
  end

  def run do
    3..1000
    |> Enum.max_by(&num_solutions/1)
    |> IO.puts
  end
end
