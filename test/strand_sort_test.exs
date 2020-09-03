defmodule StrandSortTest do
  use ExUnit.Case
  doctest StrandSort

  test "sorting" do
    r_array = Factory.random_array()

    assert StrandSort.sort(r_array) == Enum.sort(r_array)
  end
end
