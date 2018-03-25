require Integer
defmodule Numbers do
  def triangle?(n) do
    val = :math.sqrt((8 * n) + 1)
    val == Float.floor(val)
  end

  def triangle(n) do
    round((n * (n + 1))/2)
  end

  def square(n), do: :math.pow(n,2)

  def pentagonal(n), do: div(n * ((3 * n) - 1), 2)

  def pentagonal?(n) do
    p = (:math.sqrt(1 + 24*n) + 1) / 6
    p == Float.floor(p)
  end

  def hexagonal(n), do: (n * ((2 * n) - 1))

  def heptagonal(n), do: div(n * ((5 * n) - 3), 2)

  def octagonal(n), do: n * ((3 * n) - 2)

  def pandigital?(n) do
    sorted = Integer.digits(n)
    |> Enum.sort
    sorted == Enum.to_list(1..9)
  end
end

