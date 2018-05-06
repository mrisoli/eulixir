defmodule Palindrome do
  def number?(n) do
    n == String.reverse("#{n}") |> String.to_integer
  end
end
