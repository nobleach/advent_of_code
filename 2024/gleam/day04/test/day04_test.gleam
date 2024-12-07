import day04
import gleam/dict
import gleam/io
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn build_grid_test() {
  let input =
    "MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
XMASAMXAMM
MSAMASMSMX
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX"

  let actual = day04.build_grid(input)
  io.debug(actual)

  dict.get(actual, #(0, 0))
  |> should.equal(Ok("M"))
}

// gleeunit test functions end in `_test`
pub fn part_one_test() {
  let input =
    "MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
XMASAMXAMM
MSAMASMSMX
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX"
  day04.part_one(input)
  // |> should.equal(18)
}
