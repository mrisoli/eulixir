require Factorial
defmodule Prob15 do
  def run do
    round(Factorial.of(40) / (:math.pow(Factorial.of(20),2)))
    |> IO.puts
  end
end
