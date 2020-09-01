defmodule Sorting do
  @moduledoc """
  Documentation for `Sorting`.
  """

  @doc """
  You can run benchmarks for the algorithms.
  Available algs: [
    :bubble_sort, :gnome_sort, :insertion_sort,
    :merge_sort, :selection_sort, :sleep_sort, :quick_sort
  ]
  Amount should be a non-zero positive integer.

  ## Examples
      iex> algs = [:bubble_sort, :insertion_sort, :merge_sort, :selection_sort, :quick_sort]
      iex> Sorting.benchmark(algs, 10)
      :ok

  """

  def benchmark(algs, amount) do
    parent = self()

    array = random_array(amount)
    IO.puts "Sorting #{amount} elements"

    algs |> Enum.each(fn alg -> spawn_link(Sorting, :call, [parent, alg, array]) end)

    algs |> Enum.each(fn _ ->
      receive do
        {:ok, str} -> IO.puts str
      end
    end)
  end

  def call(parent, alg, array) do
    module_name = alg |> find_module_name
    time = DateTime.utc_now

    apply(module_name, :sort, [array])

    send parent, {:ok,  "#{module_name} took #{time_diff(time)}ms"}
  end

  def find_module_name(alg) do
    name = alg
      |> Atom.to_string
      |> Macro.camelize

    Module.concat([name])
  end

  defp time_diff(time) do
    DateTime.utc_now |> DateTime.diff(time, :millisecond)
  end

  defp random_array(amount) do
    Stream.repeatedly(fn -> :rand.uniform(999_999) end) |> Enum.take(amount)
  end
end
