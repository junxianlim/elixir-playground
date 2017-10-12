# Did not use erlangs :lists.merge

defmodule MergeSort do
  def run([]), do: []
  def run([x]), do: [x] 
  def run(list) do
    { l, r } = Enum.split(list, div(length(list), 2))
    merge(run(l), run(r), [])
  end

  def merge(h, [], acc), do: acc ++ h
  def merge([], t, acc), do: acc ++ t
  def merge([lh | lt] = l, [rh | rt] = r, acc) do
    cond do
      lh > rh  -> merge(l, rt, acc ++ [rh])
      rh >= lh -> merge(lt, r, acc ++ [lh])
    end
  end
end

# Test cases
ExUnit.start()

defmodule MergeSortTest do
  use ExUnit.Case

  test "does selection sort correctly" do
    assert MergeSort.run([2])                 == [2]
    assert MergeSort.run([2,3,1])             == [1,2,3]
    assert MergeSort.run([4,3,4,2,1])         == [1,2,3,4,4]
    assert MergeSort.run([8,10,11,1,6,1,5,2]) == [1,1,2,5,6,8,10,11]
    assert MergeSort.run([3,2,1,4,5,2])       == [1, 2, 2, 3, 4, 5]
  end
end