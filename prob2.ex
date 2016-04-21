require Integer
defmodule Prob2 do
  def fib(a, _, s) when a > 4000000 do s end
  def fib(a, b, s) when Integer.is_even(a) do fib(a + b, a, s + a) end
  def fib(a, b, s) do fib(a + b, a, s) end
  def run do
    IO.puts fib(2,1,0)
  end
end