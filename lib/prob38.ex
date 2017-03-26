require Numbers
defmodule Prob38 do

  defp gen_number(n) do
    to_string(n) <> to_string(n * 2)
    |> String.to_integer
  end
  def run do
    9123..9876
    |> Enum.map(&gen_number/1)
    |> Enum.filter(&Numbers.pandigital?/1)
    |> Enum.max
    |> IO.puts
  end
end
