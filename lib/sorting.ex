defmodule Sorting do
  @moduledoc """
  Documentation for `Sorting`.
  """

  @doc """
  You can run benchmarks for the algorithms.
  Available algs: [:bubble_sort, :insertion_sort, :merge_sort, :selection_sort]
  Amount should be a non-zero positive integer.

  ## Examples

      iex> Sorting.benchmark([:bubble_sort], 10)
      :ok

  """

  def benchmark(algs, amount) do
    array = random_array(amount)
    IO.puts "Sorting #{amount} elements"

    algs |> Enum.each(fn alg -> spawn(Sorting, alg, [array]) end)
  end

  def bubble_sort(array) do
    time = DateTime.utc_now
    BubbleSort.sort(array)

    IO.puts "Bubble sort took #{time_diff(time)}ms"
  end

  def insertion_sort(array) do
    time = DateTime.utc_now
    InsertionSort.sort(array)

    IO.puts "Insertion sort took #{time_diff(time)}ms"
  end

  def merge_sort(array) do
    time = DateTime.utc_now
    MergeSort.sort(array)

    IO.puts "Merge sort took #{time_diff(time)}ms"
  end

  def selection_sort(array) do
    time = DateTime.utc_now
    SelectionSort.sort(array)

    IO.puts "Selection sort took #{time_diff(time)}ms"
  end

  defp time_diff(time) do
    DateTime.utc_now |> DateTime.diff(time, :millisecond)
  end

  defp random_array(amount) do
    Stream.repeatedly(fn -> :rand.uniform(999_999) end) |> Enum.take(amount)
  end
end
