defmodule Permutations do
  def permute([]), do: [[]]
  def permute(list) do
    for x <- list, y <- permute(list -- [x]), do: [x|y]
  end

  defp rotate(res, orig) do
    [head|tail] = orig
    element = tail ++ [head]
    case element in res do
      true -> res
      false ->
        rotate(res ++ [element], element)
    end
  end

  def rotate(orig), do: rotate([], orig)
end
