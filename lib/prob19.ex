defmodule Prob19 do
  @max_date ~D[2000-12-31]

  def first_of_month?(1), do: 1
  def first_of_month?(_), do: 0

  defp count_sundays(:gt, date, count) do
    new_date = Date.add(date, 7)
    count_sundays(Date.compare(@max_date, new_date), new_date, count + first_of_month?(date.day))
  end

  defp count_sundays(_, _date, count), do: count

  def run do
    start_date = ~D[1901-01-06]
    count_sundays(Date.compare(@max_date, start_date), start_date, 0) |> IO.puts
  end
end
