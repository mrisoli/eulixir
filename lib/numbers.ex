defmodule Numbers do
  def triangle?(n) do
    val = :math.sqrt((8 * n) + 1)
    val == Float.floor(val)
  end

  def triangle(n), do: div((n * (n + 1)), 2)

  def square(n), do: :math.pow(n,2)

  def pentagonal(n), do: div(n * (3 * n - 1), 2)

  def pentagonal?(n) do
    p = (:math.sqrt(24 * n + 1) + 1) / 6
    p == trunc(p)
  end


  def hexagonal(n), do: (n * (2 * n - 1))

  def hexagonal?(n) do
    h = (:math.sqrt(8 * n + 1) + 1) / 4
    h == trunc(h)
  end


  def heptagonal(n), do: div(n * (5 * n - 3), 2)

  def octagonal(n), do: n * (3 * n - 2)

  def pandigital?(n) do
    sorted = Integer.digits(n)
    |> Enum.sort
    sorted == Enum.to_list(1..9)
  end

  def pow(n, 1), do: n
  def pow(n, p), do: n * pow(n, p - 1)
end

