defmodule Fibonnaci do
  def run(0), do: 0
  def run(1), do: 1
  def run(ctr), do: add(0, 1, ctr - 1)
  def add(_x, y, 0), do: y
  def add(x, y, ctr), do: add(y, x + y, ctr - 1)
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
    assert Fibonnaci.run(500) == 139423224561697880139724382870407283950070256587697307264108962948325571622863290691557658876222521294125
  end
end