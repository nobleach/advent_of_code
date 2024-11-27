defmodule Day09Test do
  use ExUnit.Case
  doctest Day09

  test "parses a line of numbers into signed ints" do
    input = "10 13 16 21 30 45"

    assert Day09.parse_line(input) == [10, 13, 16, 21, 30, 45]
  end

  test "builds a matrix of integers" do
    input = [10, 13, 16, 21, 30, 45]

    actual = Day09.build_matrix(input, [input])

    assert actual |> Enum.at(0) == [2, 2, 2]
    assert actual |> Enum.at(3) == [10, 13, 16, 21, 30, 45]
  end

  test "it gets the next integer" do
    input = [[2, 2, 2], [0, 2, 4, 6], [3, 3, 5, 9, 15], [10, 13, 16, 21, 30, 45]]

    actual = Day09.get_last_history_number(input)

    assert actual == 68
  end

  test "it gets the correct value for test input" do
    input = File.stream!("input.test.txt")

    assert Day09.part1(input) == 114
  end

  test "it gets the correct value for real input" do
    input = File.stream!("input.txt")

    assert Day09.part1(input) == 1_581_679_977
  end
end
