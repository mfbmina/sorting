defmodule SleepSortTest do
  use ExUnit.Case
  doctest SleepSort

  test "sorting" do
    r_array = Factory.random_array()

    assert SleepSort.sort(r_array) == Enum.sort(r_array)
  end
end
