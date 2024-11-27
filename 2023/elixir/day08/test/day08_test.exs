defmodule Day08Test do
  use ExUnit.Case
  doctest Day08

  test "parses top line into seq of directions" do
    input = """
    LLR

    AAA = (BBB, BBB)
    BBB = (AAA, ZZZ)
    ZZZ = (ZZZ, ZZZ)
    """

    assert Day08.parse() == ["L", "L", "R"]
  end
end
