defmodule Prob26 do

  defp divide(d, n, _) when rem(d,n) == 0, do: 0
  defp divide(d, n, acc) do
    case Enum.find_index(acc, fn(x) -> rem(d, n) == x end) do
      nil -> divide(rem(d,n) * 10, n, acc ++ [rem(d,n)])
      i -> Enum.count(acc) + i
    end
  end

  defp chain_size(n), do: divide(10, n, [])

  def run do
    7..1_000
    |> Enum.map(&{&1, chain_size(&1)})
    |> Enum.max_by(fn {_, v} -> v end)
    |> elem(0)
    |> IO.puts
  end
end
