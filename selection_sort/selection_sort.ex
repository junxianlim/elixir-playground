# No Enum.max()

defmodule SelectionSort do
  def run(list) when is_list(list) do
    run(list, [])
  end

  defp run([], sorted), do: sorted

  defp run([num | tail ] = list, sorted) do
    compare(list, sorted, tail, num)
  end

  defp compare(list, sorted, [num | tail], max) do
    { max, tail } = if num > max do
                      { num, [max | tail] }
                    else
                      { max, tail }
                    end

    compare(list, sorted, tail, max)
  end

  defp compare(list, sorted, [], max) do 
    List.delete(list, max) |> run([max | sorted])
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