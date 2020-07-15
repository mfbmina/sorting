defmodule BubbleSortTest do
  use ExUnit.Case
  doctest BubbleSort

  test "sorting" do
    r_array = Factory.random_array()

    assert BubbleSort.sort(r_array) == Enum.sort(r_array)
  end
end
