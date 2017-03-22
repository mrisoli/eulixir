defmodule Prime do


  def is_prime(2), do: true
  def is_prime(n) when n<2 or rem(n,2)==0, do: false
  def is_prime(n), do: is_prime(n,3)

  def is_prime(n,k) when n<k*k, do: true
  def is_prime(n,k) when rem(n,k)==0, do: false
  def is_prime(n,k), do: is_prime(n,k+2)

  def stream do
    Stream.unfold( [], fn primes ->
      next = next_prime(primes)
      { next, [next | primes] }
    end )
  end

  def take(n) when is_integer(n), do: Enum.take(stream(), n)

  def get(n) when is_integer(n), do: take(n) |> List.last

  def up_to(n) when is_integer(n) do
    stream()
    |> Stream.take_while(&(&1 < n))
  end

  defp next_prime([]), do: 2
  defp next_prime(primes) when is_list primes do
    primes |> next_primes(1) |> List.first
  end
  defp next_primes(primes, quantity) when is_list primes and is_integer quantity do
    from = List.first(primes) + 1
    integers(from)
    |> Stream.drop_while(fn number ->
      Enum.any?(primes, fn prime ->
        rem(number, prime) == 0
      end )
    end )
    |> Enum.take(quantity)
  end

  defp integers(n) when is_integer(n) do
    Stream.iterate(n, &(&1+1))
  end


  defmodule Factor do

    def list(1), do: [1]

    def list(n) when is_integer(n) and n > 1,
    do: n |> distribution |> list

    def list(dict) when is_list(dict),
    do: Keyword.keys(dict)

    def list({ :error, reason }),
    do: { :error, reason }

    def distribution(1), do: [{ 1, 1 }]

    def distribution(n) when is_integer(n) and n > 1 do
      case factorize(n) do
        { :halted, distribution } -> Enum.reverse distribution
        { :done, _ } -> { :error, "Ran out of prime numbers." }
        { :suspended, _ } -> { :error, "Couldn't get prime numbers."}
      end
    end

    defp factorize(n),
    do: Enumerable.reduce(Prime.stream, { :cont, { n, [] } }, &reducer/2)

    defp reducer(_factor, { n, distribution }) when n == 1,
    do: { :halt, distribution }

    defp reducer(factor, { n, distribution }) when factor > n,
    do: { :halt, distribution }

    defp reducer(factor, { n, distribution }) do
      result = case factor_down(n, factor) do
        []        -> { n, distribution }
        divisions -> { List.last(divisions), [{ factor, length(divisions) } | distribution] }
      end
      { :cont, result }
    end

    defp factor_down(n, factor) do
      Stream.iterate(n, &(div(&1, factor)))
      |> Stream.take_while(&(rem(&1, factor) == 0))
      |> Stream.map(&(div(&1, factor)))
      |> Enum.to_list
    end

  end

end
