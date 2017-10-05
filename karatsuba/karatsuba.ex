defmodule Karatsuba do
  def compute(x,y) do
    x_length = get_length(x)
    y_length = get_length(y)

    if x < 10 || y < 10 do 
      x * y
    else
      m = Enum.max([x_length, y_length]) / 2 |> round

      { a, b } = divmod(x, get_pow(10, m))
      { c, d } = divmod(y, get_pow(10, m))

      ac = compute(a, c)
      bd = compute(b, d)

      ad_plus_bc = compute(a + b, c + d) - ac - bd

      ac * get_pow(10, m * 2) + (ad_plus_bc * get_pow(10, m)) + bd
    end
  end

  defp get_pow(num, pow), do: :math.pow(num, pow) |> round
  
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

  test "karatsuba" do
    assert Karatsuba.compute(4, 3) == 4 * 3
    assert Karatsuba.compute(10, 20) == 10 * 20
    assert Karatsuba.compute(1234, 6789) == 1234 * 6789
    assert Karatsuba.compute(5555555, 12345) == 5555555 * 12345
    assert Karatsuba.compute(75081230, 1203123) == 75081230 * 1203123
  end
end