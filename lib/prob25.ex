defmodule Prob25 do
  defp fib(a, b, i) do 
    case Enum.count(Integer.digits(a)) do
      1000 -> i
      _ -> fib(a + b, a, i + 1)
    end
  end
  def run do
    IO.puts fib(1,1,2)
  end
end
