defmodule Prob18 do

  defp setup_triangle do
    {:ok, file} = File.read "data/tri18"
    String.split(file, "\n")
    |> Enum.map(fn x -> Enum.map(String.split(x, " "), &(String.to_integer(&1))) end)
  end

  defp add_level_up(pyramid, count) when count > 1 do
    lower_level = traverse_level(Enum.at(pyramid, -1))
    upper_level = Enum.at(pyramid, -2)
    zip = Enum.map(Enum.zip(upper_level, lower_level), fn({x, y}) -> x + y end)
    Enum.concat(Enum.drop(pyramid, -2), [zip])
    |> add_level_up(count - 1)
  end

  defp add_level_up(pyramid, _), do: Enum.sum(Enum.flat_map(pyramid, &(&1))) 
 

  defp traverse_level(l) do
    Enum.slice(l, 1..-1)
    |> Enum.zip(l)
    |> Enum.map(fn({x, y}) -> Enum.max([x,y]) end)
  end

  def run do
    triangle = setup_triangle
    add_level_up(triangle, Enum.count(triangle))
    |> IO.puts
  end
end
