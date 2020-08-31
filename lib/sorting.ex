defmodule Sorting do
  @moduledoc """
  Documentation for `Sorting`.
  """

  @doc """
  You can run benchmarks for the algorithms.
  Available algs: [:bubble_sort, :insertion_sort, :merge_sort, :selection_sort, :sleep_sort, :quick_sort]
  Amount should be a non-zero positive integer.

  ## Examples
      iex> algs = [:bubble_sort, :insertion_sort, :merge_sort, :selection_sort, :quick_sort]
      iex> Sorting.benchmark(algs, 10)
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

  def sleep_sort(array) do
    time = DateTime.utc_now
    SleepSort.sort(array)

    IO.puts "Sleep sort took #{time_diff(time)}ms"
  end

  def quick_sort(array) do
    time = DateTime.utc_now
    QuickSort.sort(array)

    IO.puts "Quick sort took #{time_diff(time)}ms"
  end

  defp time_diff(time) do
    DateTime.utc_now |> DateTime.diff(time, :millisecond)
  end

  defp random_array(amount) do
    Stream.repeatedly(fn -> :rand.uniform(999_999) end) |> Enum.take(amount)
  end
end
