defmodule Prob33 do

  defp check_for_cancel_digit(i, j, k) do
    ki = (k * 10) + i
    ij = (i * 10) + j
    case k * ij == ki * j do
      true -> {ki, ij}
      _ -> 1
    end
  end

  defp loop_numerator(i, j) do
    1..j-1
    |> Enum.map(&check_for_cancel_digit(i,j, &1))
  end

  defp loop_denominator(i) do
    1..(i-1)
    |> Enum.flat_map(&loop_numerator(i, &1))
  end

  defp get_lowest_common_term(tup), do: 1 / (elem(tup, 0) / elem(tup, 1))

  def run do
    2..9
    |> Enum.flat_map(&loop_denominator/1)
    |> Enum.filter(&is_tuple/1)
    |> Enum.reduce({1,1}, fn(x, acc) -> {elem(acc, 0) * elem(x, 0), elem(acc, 1) * elem(x, 1)} end)
    |> get_lowest_common_term
    |> IO.puts
  end
end
