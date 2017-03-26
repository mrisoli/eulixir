require Integer
defmodule Numbers do
  def triangle(n) do
    round((n * (n + 1))/2)
  end

  def pandigital?(n) do
    sorted = Integer.digits(n)
    |> Enum.sort
    sorted == Enum.to_list(1..9)
  end
end
