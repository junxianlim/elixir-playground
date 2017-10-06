defmodule InsertionSort do
  def run(list) when is_list(list), do: run(list, [])
  def run([], sorted), do: sorted
  def run([h | tail], sorted), do: run(tail, insert(h, sorted))

  defp insert(x, []), do: [x]
  defp insert(x, sorted) when x < hd(sorted), do: [x | sorted]
  defp insert(x, [h | tail]), do: [h | insert(x, tail)]
end

# Test cases
ExUnit.start()

defmodule InsertionSortTest do
  use ExUnit.Case

  test "does selection sort correctly" do
    assert InsertionSort.run([2])                 == [2]
    assert InsertionSort.run([2,3,1])             == [1,2,3]
    assert InsertionSort.run([4,3,4,2,1])         == [1,2,3,4,4]
    assert InsertionSort.run([8,10,11,1,6,1,5,2]) == [1,1,2,5,6,8,10,11]
    assert InsertionSort.run([3,2,1,4,5,2])       == [1, 2, 2, 3, 4, 5]
  end
end