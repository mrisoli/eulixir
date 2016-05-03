defmodule Eulixir do
  defp measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end

  def run(n) do
    fn -> Code.eval_string("Prob#{n}.run") end |> measure |> IO.puts
  end

  def run do
    n = IO.gets "prob number? "
    case Integer.parse(n) do
      {x, _} when is_integer(x) -> run(x)
      :error -> IO.puts "Invalid Option"
    end
  end
end
