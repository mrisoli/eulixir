defmodule Palindrome do
  def number?(n) do
    n == String.reverse("#{n}") |> Integer.parse |> elem(0)
  end
end
