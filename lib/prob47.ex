defmodule Prob47 do

  def run do
    IO.puts(find(2, 0, []))
  end

  defp find(n, 4, _), do: n - 4

  defp find(n, consecutives, primes) do
    if Prime.is_prime(n) do
      find(n + 1, 0, primes ++ [n])
    else
      find(n + 1, check_divisors(n, consecutives, primes), primes)
    end
  end

  defp check_divisors(n, consecutives, primes) do
    increase_or_reset_count(consecutives, count_divisors(n, primes))
  end

  defp increase_or_reset_count(consecutives, 4), do: consecutives + 1
  defp increase_or_reset_count(_, _), do: 0

  defp count_divisors(n, primes) do
    Enum.count(primes, &(rem(n, &1) == 0))
  end
end
