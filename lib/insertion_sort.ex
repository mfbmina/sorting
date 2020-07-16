defmodule InsertionSort do
  @moduledoc """
  Documentation for `InsertionSort`.
  """

  @doc """
  Insertion sort is a simple sorting algorithm that builds the final sorted array one item at a time.

  For futher info: https://en.wikipedia.org/wiki/Insertion_sort

  ## Examples

      iex> InsertionSort.sort([6, 1, 2, 5, 3, 4])
      [1, 2, 3, 4, 5, 6]

  """
  def sort(array), do: sort([], array)

  defp sort(sorted_array, []), do: sorted_array

  defp sort(sorted_array, old_array) do
    [value | array] = old_array

    insert(value, sorted_array)
      |> sort(array)
  end

  defp insert(value, []), do: [value]

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
