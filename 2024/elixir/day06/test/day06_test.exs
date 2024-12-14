defmodule Day06Test do
  use ExUnit.Case

  test "part_one" do
    input = """
    ....#.....
    .........#
    ..........
    ..#.......
    .......#..
    ..........
    .#..^.....
    ........#.
    #.........
    ......#...
    """

    assert Day06.part_one(input) == 41
  end

  test "parses a grid into a map of coordinates" do
    input = """
    ....#.....
    .........#
    ..........
    ..#.......
    .......#..
    ..........
    .#..^.....
    ........#.
    #.........
    ......#...
    """

    actual = Day06.parse_to_map(input)
    assert Map.get(actual, {9, 9}) == "."
    assert Map.get(actual, {0, 8}) == "#"
    assert Map.get(actual, {4, 6}) == "^"
  end

  test "turns right" do
    assert Day06.turn_right(:north) == :east
    assert Day06.turn_right(:east) == :south
    assert Day06.turn_right(:south) == :west
    assert Day06.turn_right(:west) == :north
  end
end
