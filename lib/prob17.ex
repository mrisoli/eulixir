defmodule Prob17 do
  @thousand "onethousand"
  @hundred "hundred"
  @units ["one", "two", "three", "four", "five", "six", "seven",
   "eight", "nine"]
  @tens ["ten", "eleven", "twelve", "thirteen", "fourteen",
   "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
  @dozens ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

  def sum_tens do
    Enum.map(@tens, &(String.length(&1) * 10)) |> Enum.sum
  end

  def sum_units do
    Enum.map(@units, &(String.length(&1) * 190)) |> Enum.sum
  end

  def sum_dozens do
    Enum.map(@dozens, &(String.length(&1) * 100)) |> Enum.sum
  end

  def sum_ands do
    String.length("and") * 99 * 9
  end

  def run do
    String.length(@thousand) + (String.length(@hundred) * 900) + sum_units() + sum_dozens() + sum_ands() + sum_tens()
    |> IO.puts
  end
end
