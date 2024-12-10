defmodule Day09 do
  def hello do
    :world
  end

  def part_one(input) do
    IO.inspect(build_frag_list(input))
  end

  def build_frag_list(input) do
    files =
      input
      |> Enum.take_every(2)
      |> Enum.with_index()
      |> Enum.map(fn {val, idx} ->
        fill_concat([], String.to_integer(val), Integer.to_string(idx))
      end)

    spaces =
      input
      |> Enum.drop(1)
      |> Enum.take_every(2)
      |> Enum.map(fn n -> fill_concat([], String.to_integer(n), ".") end)

    interleave(files, spaces) |> Enum.flat_map(fn a -> a end)
  end

  def fill_concat(list, len, filler) do
    list
    |> Enum.concat(Stream.repeatedly(fn -> filler end) |> Enum.take(len))
    |> Enum.take(len)
  end

  def interleave(a, b, result \\ [])
  def interleave([], [], result), do: result |> Enum.reverse()
  def interleave([], b, result), do: interleave(b, [], result)
  def interleave([h | t], b, result), do: interleave(b, t, [h | result])

  def swap(a, i1, i2) do
    {first, [e1 | middle]} = Enum.split(a, i1)
    {middle, [e2 | rest]} = Enum.split(middle, i2 - i1 - 1)
    List.flatten([first, e2, middle, e1, rest])
  end
end
