defmodule MergeSort do
  @moduledoc """
  Documentation for `MergeSort`.
  """

  @doc """
  Merge sort is an efficient, general-purpose, comparison-based sorting algorithm.

  For futher info: https://en.wikipedia.org/wiki/Merge_sort

  ## Examples

      iex> MergeSort.sort([6, 1, 2, 5, 3, 4])
      [1, 2, 3, 4, 5, 6]

  """
  def sort(array) do
    case array do
      [_] ->
        array
      _ ->
        array_size = length(array)
        half = Kernel.round(array_size / 2)

        left = Enum.take(array, half) |> sort
        right = Enum.slice(array, half..array_size) |> sort

        left |> merge(right)
    end
  end

  defp merge([], right), do: right

  defp merge(left, right) do
    [value | new_left] = left

    new_right = insert(value, right)

    merge(new_left, new_right)
  end

  defp insert(value, array) do
    index = array
      |> Enum.find_index(fn x -> value < x end)

    case index do
      nil ->
        array ++ [value]
      _ ->
        array_size = length(array) - 1

        head = Enum.take(array, index)
        tail = Enum.slice(array, index..array_size)

        head ++ [value] ++ tail
    end
  end
end
