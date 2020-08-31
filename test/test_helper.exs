ExUnit.start()

defmodule Factory do
  # Factories

  def random_array do
    Stream.repeatedly(fn -> :rand.uniform(999) end)
      |> Enum.take(10)
  end
end
