# No Enum.max()

defmodule SelectionSort do
  def run(list) when is_list(list) do
    run([], list)
  end

  defp run(sorted, []), do: sorted

  defp run(sorted, list) do
    [ num | tail ] = list
    compare(sorted, list, tail, num)
  end

  defp compare(sorted, list, [num | tail], max) do
    { max, tail } = if num > max do
                      { num, [max | tail] }
                    else
                      { max, tail }
                    end

    compare(sorted, list, tail, max)
  end

  defp compare(sorted, list, [], max) do
    list = List.delete(list, max)
    run([max | sorted], list)
  end
end

# Test cases
ExUnit.start()

defmodule SelectionSortTest do
  use ExUnit.Case

  test "does selection sort correctly" do
    assert SelectionSort.run([2,3,1])             == [1,2,3]
    assert SelectionSort.run([4,3,4,2,1])         == [1,2,3,4,4]
    assert SelectionSort.run([8,10,11,1,6,1,5,2]) == [1,1,2,5,6,8,10,11]
  end
end