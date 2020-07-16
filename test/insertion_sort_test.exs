defmodule InsertionSortTest do
  use ExUnit.Case
  doctest InsertionSort

  test "sorting" do
    r_array = Factory.random_array()

    assert InsertionSort.sort(r_array) == Enum.sort(r_array)
  end
end
