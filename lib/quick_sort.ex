defmodule QuickSort do
  @moduledoc """
  Documentation for `QuickSort`.
  """

  @doc """
  Quicksort is a divide-and-conquer algorithm. It works by selecting a 'pivot' element from the
  array and partitioning the other elements into two sub-arrays, according to whether they are less
  than or greater than the pivot.

  For futher info: https://en.wikipedia.org/wiki/Quicksort

  ## Examples

      iex> QuickSort.sort([6, 1, 2, 5, 3, 4])
      [1, 2, 3, 4, 5, 6]

  """

  def sort([]), do: []

  def sort(array) do
    {value, index} = array |> Enum.with_index |> Enum.random

    {l_array, h_array} = array |> Enum.with_index |> Enum.reduce({[], []}, fn({x, i}, {larr, harr}) ->
      case {x, i} do
        {_, i} when i == index -> {larr, harr}
        {x, _} when x < value -> {[x | larr], harr}
        _ -> {larr, [x | harr]}
      end
    end)

    sort(l_array) ++ [value] ++ sort(h_array)
  end
end
