defmodule GnomeSortTest do
  use ExUnit.Case
  doctest GnomeSort

  test "sorting" do
    r_array = Factory.random_array()

    assert GnomeSort.sort(r_array) == Enum.sort(r_array)
  end
end
