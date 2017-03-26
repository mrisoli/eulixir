require Prime
require Integer
defmodule Prob37 do

  defp check_for_prime([]), do: true
  defp check_for_prime(digits) do
    Enum.join(digits)
    |> String.to_integer
    |> Prime.is_prime
  end

  defp is_left_truncatable?([]), do: true

  defp is_left_truncatable?([_ | tail]) do
    check_for_prime(tail) and is_left_truncatable?(tail)
  end

  defp is_right_truncatable?([]), do: true

  defp is_right_truncatable?([_ | tail]) do
    check_for_prime(Enum.reverse(tail)) and is_right_truncatable?(tail)
  end

  defp is_truncatable_prime?(n) when n < 20, do: false
  defp is_truncatable_prime?(n) do
    digits = Integer.digits(n)
    is_left_truncatable?(digits) and is_right_truncatable?(Enum.reverse(digits))
  end

  def run do
    Prime.up_to(1_000_000)
    |> Enum.filter(&is_truncatable_prime?/1)
    |> Enum.sum
    |> IO.puts
  end
end
