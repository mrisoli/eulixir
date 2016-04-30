defmodule Prob13 do
  def run do
    {:ok, file} = File.read "data/prob13data"
    String.split(file, "\n")
    |> Enum.map(&(String.to_integer(&1)))
    |> Enum.sum
    |> Integer.to_string
    |> String.slice(0,10)
    |> IO.puts
  end
end
