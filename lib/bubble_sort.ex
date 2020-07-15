defmodule BubbleSort do
  @moduledoc """
  Documentation for `BubbleSort`.
  """

  @doc """
  Bubble sort, is a simple sorting algorithm that repeatedly steps through the list, compares adjacent elements and swaps them
  if they are in the wrong order. The pass through the list is repeated until the list is sorted. The algorithm,
  which is a comparison sort, is named for the way smaller or larger elements "bubble" to the top of the list.

  For futher info: https://www.geeksforgeeks.org/bubble-sort/

  ## Examples

      iex> BubbleSort.sort([6, 1, 2, 5, 3, 4])
      [1, 2, 3, 4, 5, 6]

  """
  def sort(array), do: sort(array, 0, 1)

  defp sort(array, i, j) do
    x = Enum.at(array, i)
    y = Enum.at(array, j)

    case {x, y} do
      {nil, nil} ->
        array
      {_, nil} ->
        array
          |> sort(i + 1, i + 2)
      {^x, ^y} when x > y ->
        { head, body, tail } = split_array(array, i, j)
        head ++ [y] ++ body ++ [x] ++ tail
          |> sort(i, j + 1)
      _ ->
        array
          |> sort(i, j + 1)
    end
  end

  defp split_array(array, i, j) do
    array_size = length(array) - 1
    head = Enum.take(array, i)
    body = Enum.slice(array, i + 1..j - 1)
    tail = Enum.slice(array, j + 1..array_size)

    { head, body, tail }
  end
end
