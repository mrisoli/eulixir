defmodule Prob22 do
  defp sum_list([], _, accumulator), do: accumulator
  defp sum_list([head | tail], count, accumulator) do
    sum_list(tail, count + 1, accumulator + string_value(head, count))
  end
  defp string_value(s, mult) do
    Enum.sum(Enum.map(to_char_list(s), &(&1 - 64))) * mult
  end
  def run do
    {:ok, file} = File.read "data/p022_names.txt"
    String.split(file, ",")
    |> Enum.sort
    |> sum_list(1, 0)
    |> IO.puts
  end
end
