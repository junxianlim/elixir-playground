# No Enum.max()

defmodule SelectionSort do
  def run(list) when is_list(list), do: run(list, [])
  def run([], sorted), do: sorted
  def run([num | tail] = list, sorted), do: compare(list, sorted, tail, num)

  defp compare(list, sorted, [num | tail], max) do
    { max, tail } = if num > max do
                      { num, [max | tail] }
                    else
                      { max, tail }
                    end
    compare(list, sorted, tail, max)
  end

  defp compare(list, sorted, [], max), do: List.delete(list, max) |> run([max | sorted])
end

# Test cases
ExUnit.start()

defmodule SelectionSortTest do
  use ExUnit.Case

  test "does selection sort correctly" do
    assert SelectionSort.run([2])                 == [2]
    assert SelectionSort.run([2,3,1])             == [1,2,3]
    assert SelectionSort.run([4,3,4,2,1])         == [1,2,3,4,4]
    assert SelectionSort.run([8,10,11,1,6,1,5,2]) == [1,1,2,5,6,8,10,11]
    assert SelectionSort.run([3,2,1,4,5,2])       == [1, 2, 2, 3, 4, 5]
  end
end