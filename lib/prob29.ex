defmodule Prob29 do

  defp generate_powers(n) do
    2..100
    |> Enum.map(fn(x) -> :math.pow(n, x) end)
  end

  def run do
    2..100
    |> Enum.flat_map(fn(x) -> generate_powers(x) end)
    |> Enum.uniq
    |> Enum.count
    |> IO.puts
  end
end
