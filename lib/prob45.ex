require Numbers
defmodule Prob45 do

  defp find (n) do
    t = Numbers.triangle(n)
    if Numbers.pentagonal?(t) and Numbers.hexagonal?(t) do
      t
    else
      find(n + 1)
    end
  end

  def run do
    IO.puts(find(286))
  end
end
