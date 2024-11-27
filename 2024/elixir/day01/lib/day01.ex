defmodule Day01 do
  @moduledoc """
  Documentation for `Day01`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Day01.part01()
      :world

  """
  def part01 do
    :world
  end

  def parse_digits(str) do
    str
    |> String.split("\n")
    |> Enum.filter(fn s -> String.match?(s, ~r/\d/) end)
  end
end
