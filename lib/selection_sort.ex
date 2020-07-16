defmodule SelectionSort do
  @moduledoc """
  Documentation for `SelectionSort`.
  """

  @doc """
  The selection sort algorithm sorts an array by repeatedly finding the minimum element (considering ascending order)
  from unsorted part and putting it at the beginning.

  For futher info: https://www.geeksforgeeks.org/selection-sort/

  ## Examples

      iex> SelectionSort.sort([6, 1, 2, 5, 3, 4])
      [1, 2, 3, 4, 5, 6]

  """
  def sort(array), do: sort([], array)

  defp sort(sorted_array, []), do: sorted_array

  defp sort(sorted_array, old_array) do
    {value, index} = min_value(old_array)

    new_sorted_array = sorted_array ++ [value]
    new_array = cleanup_array(old_array, index)

    sort(new_sorted_array, new_array)
  end

  defp min_value(array) do
    array
      |> Enum.with_index
      |> Enum.min
  end

  defp cleanup_array(array, index) do
    array_size = length(array) - 1

    head = Enum.take(array, index)
    tail = Enum.slice(array, index + 1..array_size)

    head ++ tail
  end
end
