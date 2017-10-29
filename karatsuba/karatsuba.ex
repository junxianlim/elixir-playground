defmodule Karatsuba do
  def run(x,y) when x < 10 or y < 10 do
    x * y
  end

  def run(x,y) do
    m = Enum.max([get_length(x), get_length(y)]) |> div(2)

    { a, b } = divmod(x, pow(10, m))
    { c, d } = divmod(y, pow(10, m))

    ac = run(a,c)
    bd = run(b,d)

    ad_plus_bc = run(a + b, c + d) - ac - bd

    ac * pow(10, m * 2) + (ad_plus_bc * pow(10, m)) + bd
  end

  defp divmod(num, m) do
    r = rem(num, m)
    { div(num - r, m), r }
  end

  defp get_length(num), do: num |> Integer.digits |> Enum.count
  defp pow(n, e), do: pow(n, e, 1)
  defp pow(_, 0, acc), do: acc
  defp pow(n, e, acc), do: pow(n, e - 1, n * acc)
end

# Test cases

ExUnit.start()

defmodule KaratsubaTest do
  use ExUnit.Case

  test "multiplies correctly using the karatsuba algorithm" do
    assert Karatsuba.run(4, 3)              == 4 * 3
    assert Karatsuba.run(10, 20)            == 10 * 20
    assert Karatsuba.run(1234, 6789)        == 1234 * 6789
    assert Karatsuba.run(5555555, 12345)    == 5555555 * 12345
    assert Karatsuba.run(75081230, 1203123) == 75081230 * 1203123
    assert Karatsuba.run(
      3141592653589793238462643383279502884197169399375105820974944592,
      2718281828459045235360287471352662497757247093699959574966967627
    ) == 8539734222673567065463550869546574495034888535765114961879601127067743044893204848617875072216249073013374895871952806582723184
  end
end