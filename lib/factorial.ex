defmodule Factorial do
  def of(n) when n > 1 do
    n * of(n - 1)
  end
  def of(1), do: 1
end
