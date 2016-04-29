defmodule Prob5 do
  defp gcd(a,0), do: abs(a)
  defp gcd(a,b), do: gcd(b, rem(a,b))
  defp lcm(a,b), do: div(abs(a*b), gcd(a,b))

  def run do
    Enum.reduce(11..20, fn(x, acc) -> lcm(x,acc) end)
    |> IO.puts
  end
end
