defmodule Day09Test do
  use ExUnit.Case

  test "runs part_one" do
    input = ["1", "2", "3", "4", "5"]
    Day09.part_one(input)
  end

  test "fills a list with dots" do
    assert Day09.fill_concat([], 5, ".") == [".", ".", ".", ".", "."]
  end

  test "returns a fragmented list" do
    input = "2333133121414131402" |> String.split("", trim: true)

    assert Day09.build_frag_list(input) == [
             "0",
             "0",
             ".",
             ".",
             ".",
             "1",
             "1",
             "1",
             ".",
             ".",
             ".",
             "2",
             ".",
             ".",
             ".",
             "3",
             "3",
             "3",
             ".",
             "4",
             "4",
             ".",
             "5",
             "5",
             "5",
             "5",
             ".",
             "6",
             "6",
             "6",
             "6",
             ".",
             "7",
             "7",
             "7",
             ".",
             "8",
             "8",
             "8",
             "8",
             "9",
             "9"
           ]
  end
end
