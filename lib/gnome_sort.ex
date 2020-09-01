defmodule GnomeSort do
  @moduledoc """
  Documentation for `GnomeSort`.
  """

  @doc """
  Gnome Sort is based on the concept of a Garden Gnome sorting his flower pots.

  He looks at the flower pot next to him and the previous one; if they are in the right order he steps one pot forward,
  otherwise he swaps them and steps one pot backwards. If there is no previous pot (he is at the starting of the pot line),
  he steps forwards; if there is no pot next to him (he is at the end of the pot line), he is done.

  For futher info: https://www.geeksforgeeks.org/gnome-sort-a-stupid-one/

  ## Examples

      iex> GnomeSort.sort([6, 1, 2, 5, 3, 4])
      [1, 2, 3, 4, 5, 6]

  """

  def sort(array), do: sort(array, 0)

  defp sort(array, -1), do: sort(array, 0)

  defp sort(array, i) do
    x = Enum.at(array, i)
    y = Enum.at(array, i + 1)

    case {x, y} do
      {_, nil} ->
        array
      {^x, ^y} when x > y ->
        {head, tail} = split_array(array, i, i + 1)
        head ++ [y] ++ [x] ++ tail
          |> sort(i - 1)
      _ ->
        array
          |> sort(i + 1)
    end
  end

  defp split_array(array, i, j) do
    array_size = length(array) - 1
    head = Enum.take(array, i)
    tail = Enum.slice(array, j+1..array_size)

    {head, tail}
  end
end
