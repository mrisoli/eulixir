require Prime
defmodule Prob46 do

  defp is_valid? (n) do
    i = :math.sqrt(div(n, 2))
    i == trunc(i)
  end

  defp find_proof(true, n), do: find(n + 2)
  defp find_proof(false, n), do: n

  defp find(n) do
    if Prime.is_prime(n) do
      find(n + 2)
    else
      Prime.up_to(n)
      |> Stream.map(fn x -> n - x end)
      |> Enum.any?(&is_valid?/1)
      |> find_proof(n)
    end
  end

  def run do
    IO.puts(find(35))
  end
end
