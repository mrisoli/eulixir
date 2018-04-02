defmodule Eulixir.CLI do
  def main([]) do
    Eulixir.run
    # Do stuff
  end

  def main([number]) do
    String.to_integer(number)
    |> Eulixir.run
  end
end
