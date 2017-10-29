defmodule Euclidean do
  def run(x, 0), do: x
  def run(x, y), do: run(y, rem(x,y))
end

# Test cases
ExUnit.start()

defmodule EuclideanTest do
  use ExUnit.Case

  test "does Euclidean (GCD) correctly" do
    assert Euclidean.run(0,1)             == 1
    assert Euclidean.run(100,0)           == 100
    assert Euclidean.run(10,3)            == 1
    assert Euclidean.run(10,4)            == 2
    assert Euclidean.run(234324,150123)   == 3
    assert Euclidean.run(3918848,1653264) == 61232
  end
end