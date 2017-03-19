require Permutations

defmodule Prob32 do

  defp add_if_product(el1, el2, prod) when el1 * el2 == prod, do: prod
  defp add_if_product(_, _, _), do: 0

  defp get_value(arr), do: String.to_integer(Enum.join(arr))

  defp check_product(arr) do
    a = add_if_product(
      get_value(Enum.slice(arr, 0..1)),
      get_value(Enum.slice(arr, 2..4)),
      get_value(Enum.slice(arr, 5..9))
    )
    b = add_if_product(
      get_value(Enum.slice(arr, 0..0)),
      get_value(Enum.slice(arr, 1..4)),
      get_value(Enum.slice(arr, 5..9))
    )
    Enum.max([a,b])
  end

  def run do
    Permutations.permute([1,2,3,4,5,6,7,8,9])
    |> Enum.map(&check_product/1)
    |> Enum.uniq
    |> Enum.sum
    |> IO.puts
  end
end
