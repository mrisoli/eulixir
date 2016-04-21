defmodule Runner do
  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end

  def run do
    n = IO.gets "prob number? "
    case Integer.parse(n) do
      {x, _} when is_integer(x) -> fn -> Code.eval_string("Prob#{x}.run") end |> measure |> IO.puts
      :error -> IO.puts "Invalid Option"
    end
  end
end

Runner.run
