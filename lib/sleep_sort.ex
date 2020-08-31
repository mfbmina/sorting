defmodule SleepSort do
  @moduledoc """
  Documentation for `SleepSort`.
  """

  @doc """
  Sleep sort is a algorithm where a different thread is created for each of the elements in the input array
  and then each thread sleeps for an amount of time which is proportional to the value of corresponding array element.

  For futher info: http://rosettacode.org/wiki/Sorting_algorithms/Sleep_sort

  ## Examples

      iex> SleepSort.sort([6, 1, 2, 5, 3, 4])
      [1, 2, 3, 4, 5, 6]

  """

  def sort(array) do
    parent = self()

    array |> Enum.each(fn value -> spawn(SleepSort, :insert, [parent, value]) end)

    new_array = array |> Enum.map(fn _ ->
      receive do
        {:ok, v} -> v
      end
    end)

    new_array
  end

  def insert(parent, value) do
    :timer.sleep(value)

    send parent, {:ok, value}
  end
end
