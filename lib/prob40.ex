defmodule Prob40 do
  defp get_digit(str, i), do: String.to_integer(String.at(str, i))

  defp generate(str, _) when byte_size(str) >= 1_000_000, do: str
  defp generate(str, i), do: generate(str <> Integer.to_string(i), i + 1)

  def run do
    str = generate("", 1)
    [0, 9, 99, 999, 9_999, 99_999, 999_999]
    |> Enum.map(&get_digit(str, &1))
    |> Enum.reduce(fn(x, acc) -> x * acc end)
    |> IO.puts
  end
end

