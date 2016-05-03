require Integer
defmodule Prob14 do

  defp sequence(n) when rem(n, 2) == 0, do: round(n / 2)
  defp sequence(n) when rem(n, 2) == 1, do: (3 * n) + 1
  defp sequence_size_for(n) do
    Stream.iterate(n, &(sequence(&1)))
    |> Stream.take_while(&(&1 > 1))
    |> Enum.count
  end

  defp chains do
    500_001..999_999
    |> Stream.filter(&(Integer.is_odd(&1)))
    |> Map.new(fn x -> {x, sequence_size_for(x) + 1} end)
  end
  
  def run do
    c = chains
    Enum.find(Map.keys(c), &(c[&1] == Enum.max(Map.values(c))))
    |> IO.puts
  end
end
