defmodule Prob31 do

  @coins [1, 2, 5, 10, 20, 50, 100, 200]

  defp add_up(ways, index, _) when index >= tuple_size(ways), do: ways
  defp add_up(ways, index, coin) do
    ways
    |> put_elem(index, elem(ways, index) + elem(ways, index - coin))
    |> add_up(index + 1, coin)
  end

  defp find(ways, []), do: elem(ways, 200)

  defp find(ways, [coin | coins]) do
    add_up(ways, coin, coin)
    |> find(coins)
  end

  defp create_table(runs, table) when runs > 200, do: table
  defp create_table(runs, table), do: create_table(runs + 1, Tuple.append(table, 0))

  def run do
    create_table(1, {1})
    |> find(@coins)
    |> IO.puts
  end

end
