require Factorial
defmodule Prob34 do

  defp find_factorial_sum(n) do
    Integer.digits(n)
    |> Enum.reduce(0, fn(x, acc) ->  acc + Factorial.of(x) end)
  end

  defp get_digit_factorials(n), do: n == find_factorial_sum(n)

  def run do
    11..1_000_000
    |> Enum.filter(&get_digit_factorials/1)
    |> Enum.sum
    |> IO.puts
  end
end
