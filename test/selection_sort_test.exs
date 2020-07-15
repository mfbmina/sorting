defmodule SelectionSortTest do
  use ExUnit.Case
  doctest SelectionSort

  test "sorting" do
    r_array = Factory.random_array()

    assert SelectionSort.sort(r_array) == Enum.sort(r_array)
  end
end
