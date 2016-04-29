defmodule Prob9 do
  defp triplet(a,b) do
    c = 1000 - a - b
    cond do
      c * c == (a * a) + (b * b) -> a * b * c
      a < 332 -> triplet( a + 1, b)
      b < 497 -> triplet( 3, b + 1)
    end
  end

  def run do
    IO.puts(triplet(3,4))
  end
end
