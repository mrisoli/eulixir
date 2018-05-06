defmodule Prob48 do
  def run do
    1..1_000
    |> Enum.map(&(pow(&1, &1)))
    |> Enum.sum
    |> rem(10_000_000_000)
    |> IO.puts
  end

  defp pow(n, 1), do: n
  defp pow(n, p), do: n * pow(n, p - 1)

end
