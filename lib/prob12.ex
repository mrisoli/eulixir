defmodule Prob12 do

  defp find(n) do
    num = Numbers.triangle(n + 1)
    cond do
      divisors(num) > 500 -> num
      true -> find(n + 1)
    end
  end
  defp divisors(n) do
    2 * (1..round(:math.sqrt(n)) |> Enum.count( &(rem(n,&1) == 0)))
  end
  def run do
    find(1)
    |> IO.puts
  end
end
