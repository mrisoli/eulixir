defmodule Prob42 do

  def count_char_values(str) do
    String.codepoints(str)
    |> Enum.map(fn(x) ->
      <<cp::utf8>> = x
      cp - 64
    end)
    |> Enum.sum
  end

  def run do
    {:ok, file} = File.read "data/p42_words.txt"
    String.split(file, ",")
    |> IO.inspect
    |> Enum.map(&count_char_values/1)
    |> Enum.filter(&Numbers.triangle?/1)
    |> Enum.count
    |> IO.puts
  end
end
