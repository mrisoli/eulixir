require Numbers
defmodule Prob45 do

  defp pentagonal_and_hexagonal? (n) do
    if Numbers.pentagonal?(n) and Numbers.hexagonal?(n) do
      IO.puts(n)
      true
    else
      false
    end
  end

  def run do
    286..10_000_000
    |> Stream.map(&Numbers.triangle/1)
    |> Stream.take_while(fn n -> not pentagonal_and_hexagonal?(n) end)
    |> Enum.to_list
  end
end
