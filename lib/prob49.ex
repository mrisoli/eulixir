require Prime
defmodule Prob49 do
  def run do
    IO.puts(find(1489))
  end

  defp find(n) do
    if Enum.all?([n, n + 3330, n + 6660], fn x -> Prime.is_prime(x) and is_permutation(n, x) end) do
      Enum.join([n, n + 3330, n + 6660], "")
    else
      find(n + 2)
    end
  end

  defp is_permutation(k, j) do
    Enum.sort(Integer.digits(k)) == Enum.sort(Integer.digits(j))
  end
end
