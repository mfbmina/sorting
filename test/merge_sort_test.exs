defmodule MergeSortTest do
  use ExUnit.Case
  doctest MergeSort

  test "sorting" do
    r_array = Factory.random_array()

    assert MergeSort.sort(r_array) == Enum.sort(r_array)
  end
end
