require Palindrome
defmodule Prob36 do

  defp is_double_binary(n) do
    binary_str = Integer.to_string(n, 2)
    String.reverse(binary_str) == binary_str
  end

  defp is_double_palindrome(n) do
    Palindrome.number?(n) and is_double_binary(n)
  end

  def run do
    1..1_000_000
    |> Enum.filter(&is_double_palindrome/1)
    |> Enum.sum
    |> IO.puts
  end
end
