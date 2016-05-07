require Factorial
defmodule Prob20 do
  def run do
    Factorial.of(100)
    |> Integer.digits
    |> Enum.sum
    |> IO.puts
  end
end
