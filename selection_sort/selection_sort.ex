# No Enum.max()

defmodule SelectionSort do
  def run(original_list) when is_list(original_list) do
    run([], original_list)
  end

  defp run(sorted_list, []), do: sorted_list

  defp run(sorted_list, original_list) do
    [ num | tail ] = original_list
    compare(sorted_list, original_list, tail, num)
  end

  defp compare(sorted_list, original_list, [head | tail], biggestNumber) do
    { biggestNumber, tail } = if head > biggestNumber do
                                newBiggestNumber = head
                                newTail = [biggestNumber | tail]
                                { newBiggestNumber, newTail }
                              else
                                { biggestNumber, tail }
                              end

    compare(sorted_list, original_list, tail, biggestNumber)
  end

  defp compare(sorted_list, original_list, [], biggestNumber) do
    original_list = List.delete(original_list, biggestNumber)
    sorted_list = [biggestNumber | sorted_list]
    run(sorted_list, original_list)
  end
end

# Test cases
ExUnit.start()

defmodule SelectionSortTest do
  use ExUnit.Case

  test "does selection sort correctly" do
    assert SelectionSort.run([2,3,1])              == [1,2,3]
    assert SelectionSort.run([4,3,4,2,1])          == [1,2,3,4,4]
  end
end