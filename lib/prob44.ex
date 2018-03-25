require Numbers
defmodule Prob44 do

  defp pentagonal_diff_sum?(k, j) do
    Numbers.pentagonal?(k + j) and Numbers.pentagonal?(abs(k - j))
  end

  defp pentagonal_or_none(k, j) do
    if pentagonal_diff_sum?(k, j) do
      abs(k - j)
    else
      :none
    end
  end

  defp get_all_diffs(numbers, n) do
    numbers
    |> Stream.map(fn x -> pentagonal_or_none(x,n) end)
  end

  defp get_pentagonal_diffs(numbers) do
    numbers
    |> Stream.flat_map(fn n -> get_all_diffs(numbers, n) end)
  end

  defp gen_numbers do
    1..3_000
    |> Stream.map(&Numbers.pentagonal/1)
  end

  def run do
    gen_numbers
    |> get_pentagonal_diffs
    |> Stream.filter(&is_integer/1)
    |> Enum.min
    |> IO.puts
  end
end
