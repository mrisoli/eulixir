defmodule Prob10 do
  def run do
    2..2_000_000 |> Enum.reject(&(!Prime.is_prime(&1))) |> Enum.sum |> IO.puts
  end
end
