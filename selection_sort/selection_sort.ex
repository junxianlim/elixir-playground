defmodule SelectionSort do
  def compute(original_list) do
    [firstNum | tail] = original_list
    sorted_list = []

    compute(sorted_list, original_list, tail, firstNum)
  end

  def compute(sorted_list, original_list, [head | tail], biggestNumber) do
    if head > biggestNumber do
      newTail = [biggestNumber | tail]
      newBiggestNumber = head
      compute(sorted_list, original_list, newTail, newBiggestNumber)
    else
      compute(sorted_list, original_list, tail, biggestNumber)
    end
  end

  def compute(sorted_list, original_list, [], biggestNumber) do
    original_list = :lists.delete(biggestNumber, original_list)
    sorted_list = [biggestNumber | sorted_list]

    if original_list != [] do
      [num | tail] = original_list
      compute(sorted_list, original_list, tail, num)
    else 
      sorted_list
    end
  end
end

# Test cases

ExUnit.start()

defmodule SelectionSortTest do
  use ExUnit.Case

  test "does selection sort correctly" do
    assert SelectionSort.compute([2,3,1])              == [1,2,3]
    assert SelectionSort.compute([4,3,4,2,1])          == [1,2,3,4,4]
  end
end