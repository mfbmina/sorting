ExUnit.start()

defmodule Factory do
  # Factories

  def random_array do
    Stream.repeatedly(fn -> :rand.uniform(999_999) end)
      |> Stream.uniq
      |> Enum.take(10)
  end
end
