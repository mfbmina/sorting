defmodule BubbleSortTest do
  use ExUnit.Case
  doctest BubbleSort

  test "it sorts" do
    r_array = Stream.repeatedly(fn -> :rand.uniform(50) end) |> Stream.uniq |> Enum.take(10)
    assert BubbleSort.sort(r_array) == Enum.sort(r_array)
  end
end
