use Timex
defmodule Prob19 do
  defp check_for_first_of_month(date, count) do
    case date == Timex.beginning_of_month(date) do
      true -> count_sundays(Timex.shift(date, days: 7), count + 1)
      _ -> count_sundays(Timex.shift(date, days: 7), count)
    end
  end

  defp count_sundays(date, count) do
    case Timex.before?(date, Timex.date({2000,12,31})) do
      true -> check_for_first_of_month(date, count)
      _ -> count
    end
  end

  def run do
    count_sundays(Timex.date({1901, 1, 6}), 0) |> IO.puts
  end
end
