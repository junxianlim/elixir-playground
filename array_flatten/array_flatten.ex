defmodule ArrayFlatten do
  def run(a), do: flatten(a, [])
  defp flatten([h|t], acc) when is_list(h), do: flatten(t, flatten(h, acc))
  defp flatten([h|t], acc), do: flatten(t, acc ++ [h])
  defp flatten([], acc), do: acc
end

# Test cases
ExUnit.start()

defmodule ArrayFlattenTest do
  use ExUnit.Case

  test "flattens array correctly" do
    assert ArrayFlatten.run([])                        == []
    assert ArrayFlatten.run([1,2,4,3])                 == [1,2,4,3]
    assert ArrayFlatten.run([1,[3,2],4])               == [1,3,2,4]
    assert ArrayFlatten.run([1,[3,2,[1,4,[5,6]]],7,8]) == [1,3,2,1,4,5,6,7,8]
    assert ArrayFlatten.run([1,2,[4,5,[6],[7,8]]])     == [1,2,4,5,6,7,8]
  end
end