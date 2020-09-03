defmodule StrandSort do
  @moduledoc """
  Documentation for `StrandSort`.
  """

  @doc """
  Strand sort is a recursive sorting algorithm that sorts items of a list into increasing order

  For futher info: https://en.wikipedia.org/wiki/Strand_sort

  ## Examples

      iex> StrandSort.sort([6, 1, 2, 5, 3, 4])
      [1, 2, 3, 4, 5, 6]

  """

  def sort(array), do: sort([], array)

  defp sort(sorted_array, []), do: sorted_array

  defp sort(sorted_array, old_array) do
    {l_array, h_array} = split_array(old_array)

    h_array ++ sorted_array
      |> sort(l_array)
  end

  defp split_array([value | array]) do
    {l_array, h_array} = array |> Enum.reduce({[], []}, fn(x, {larr, harr}) ->
      case x do
        x when x < value -> {[x | larr], harr}
        _ -> {larr, insert(x, harr)} # insert the value in the correct place
      end
    end)

    {l_array, [value] ++ h_array}
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
