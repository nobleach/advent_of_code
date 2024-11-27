defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  test "greets the world" do
    assert Day01.part01() == :world
  end

  test "gets all digits from string" do
    assert Day01.parse_digits("1abc2") == "12"
  end
end
