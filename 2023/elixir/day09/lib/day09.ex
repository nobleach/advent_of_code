defmodule Day09 do
  def parse_line(line) do
    line
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  def build_matrix(input, matrix) do
    new_list =
      input
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.map(fn [op1, op2] -> op2 - op1 end)

    if Enum.all?(new_list, &(&1 == 0)) do
      matrix
    else
      build_matrix(new_list, [new_list | matrix])
    end
  end

  @spec get_last_history_number(matrix :: list(list(integer))) :: integer
  def get_last_history_number(matrix) do
    matrix
    |> List.foldl(0, fn curr, acc -> List.last(curr) + acc end)
  end

  def part1(file_input) do
    file_input
    |> Stream.map(fn line ->
      input = parse_line(line)
      matrix = build_matrix(input, [input])
      res = get_last_history_number(matrix)
      res
    end)
    |> Enum.to_list()
    |> Enum.sum()
  end
end
