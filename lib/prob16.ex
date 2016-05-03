defmodule Prob16 do
  def run do
    :math.pow(2,1000)
    |> round
    |> Integer.digits
    |> Enum.sum
    |> IO.puts
  end
end
