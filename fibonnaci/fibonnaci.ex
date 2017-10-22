defmodule Fibonnaci do
  def run(0), do: 0
  def run(1), do: 1
  def run(ctr), do: add(0, 1, ctr - 1)

  def add(_x, y, 0), do: y
  def add(x, y, ctr) do
    x = x + y
    add(y, x, ctr - 1)
  end
end

# Test cases
ExUnit.start()

defmodule FibonnaciTest do
  use ExUnit.Case

  test "does Fibonnaci correctly" do
    assert Fibonnaci.run(0)   == 0
    assert Fibonnaci.run(1)   == 1
    assert Fibonnaci.run(2)   == 1
    assert Fibonnaci.run(3)   == 2
    assert Fibonnaci.run(4)   == 3
    assert Fibonnaci.run(10)  == 55
    assert Fibonnaci.run(25)  == 75025 
    assert Fibonnaci.run(50)  == 12586269025
    assert Fibonnaci.run(100) == 354224848179261915075
    assert Fibonnaci.run(200) == 280571172992510140037611932413038677189525
  end
end