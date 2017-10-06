defmodule BubbleSort do
  def run(list) when length(list)<2, do: list
  def run(list) when is_list(list), do: run(list, list) 
  
  defp run(ref, sorted) do
    case compare(sorted) do
      ^ref ->
        sorted
      sorted ->
        run(sorted, sorted)
    end
  end

  defp compare([x]), do: [x]  
  defp compare([x,y | t]) when x > y, do: [y | compare([x | t])]
  defp compare([x,y | t]), do: [x | compare([y | t])]
end

# Test cases
ExUnit.start()

defmodule BubbleSortTest do
  use ExUnit.Case

  test "does selection sort correctly" do
    assert BubbleSort.run([2])                 == [2]
    assert BubbleSort.run([2,3,1])             == [1,2,3]
    assert BubbleSort.run([4,3,4,2,1])         == [1,2,3,4,4]
    assert BubbleSort.run([8,10,11,1,6,1,5,2]) == [1,1,2,5,6,8,10,11]
    assert BubbleSort.run([3,2,1,4,5,2])       == [1, 2, 2, 3, 4, 5]
  end
end

defmodule Moon do
  def add(x,y) do
    x+y
  end
end 