defmodule QuickSortTest do
  use ExUnit.Case
  doctest QuickSort

  test "sorting" do
    r_array = Factory.random_array()

    assert QuickSort.sort(r_array) == Enum.sort(r_array)
  end
end
