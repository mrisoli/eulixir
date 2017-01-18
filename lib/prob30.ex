defmodule Prob30 do

  defp digit_fifth_power(n) do
    Integer.digits(n)
    |> Enum.map(fn(x) -> round(:math.pow(x, 5)) end)
    |> Enum.sum
  end
  defp is_digit_fifth_power(n), do: n == digit_fifth_power(n)

  def run do
    1_000..1_000_000
    |> Enum.filter(&is_digit_fifth_power/1)
    |> Enum.sum
    |> IO.puts
  end
end
