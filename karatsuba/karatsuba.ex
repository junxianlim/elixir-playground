defmodule Karatsuba do
  def run(x,y) when x < 10 or y < 10  do
    x * y
  end

  def run(x,y) do
    x_length = get_length(x)
    y_length = get_length(y)

    m = Enum.max([x_length, y_length]) / 2 |> round

    { a, b } = divmod(x, ten_pow(m))
    { c, d } = divmod(y, ten_pow(m))

    ac = run(a, c)
    bd = run(b, d)

    ad_plus_bc = run(a + b, c + d) - ac - bd

    ac * ten_pow(m * 2) + (ad_plus_bc * ten_pow(m)) + bd
  end

  defp ten_pow(pow), do: :math.pow(10, pow) |> round
  
  defp get_length(num), do: num |> Integer.digits |> Enum.count

  defp divmod(num, m) do
    rem = Integer.mod(num, m)
    div = (num - rem) / m |> round
    { div, rem }
  end
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
  end
end