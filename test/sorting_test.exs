defmodule SortingTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  doctest Sorting

  test "when benchmarking it prints to stdout" do
    assert capture_io(fn -> Sorting.benchmark([], 10) end) == "Sorting 10 elements\n"
  end
end
