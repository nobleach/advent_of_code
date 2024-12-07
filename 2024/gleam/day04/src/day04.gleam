////////////// These are not at all my solutions
////////////// I couldn't even get my grid to build into a dict properly
/////////////  these solutions are from: https://github.com/joshi-monster/aoc2024/blob/main/src/aoc_2024/day_4.gleam

import gleam/bool
import gleam/dict
import gleam/io
import gleam/list
import gleam/string
import simplifile

pub fn main() {
  io.println("Hello from day04!")
  let assert Ok(input) = simplifile.read("./src/input.txt")
  io.debug(part_one(input))
  io.debug(part_two(input))
}

const directions = [
  #(1, 0), #(-1, 0), #(0, 1), #(0, -1), #(1, 1), #(-1, 1), #(1, -1), #(-1, -1),
]

pub fn build_grid(input: String) {
  use dict, line, row <- list.index_fold(string.split(input, "\n"), dict.new())
  use dict, chr, col <- list.index_fold(string.to_graphemes(line), dict)
  case chr {
    "X" | "M" | "A" | "S" -> dict.insert(dict, #(row, col), chr)
    _ -> dict
  }
}

pub fn part_one(input: String) {
  let grid = build_grid(input)

  use count, #(row, col), chr <- dict.fold(grid, 0)
  use <- bool.guard(when: chr != "X", return: count)
  use count, #(dy, dx) <- list.fold(directions, count)
  case
    dict.get(grid, #(row + 1 * dy, col + 1 * dx)),
    dict.get(grid, #(row + 2 * dy, col + 2 * dx)),
    dict.get(grid, #(row + 3 * dy, col + 3 * dx))
  {
    Ok("M"), Ok("A"), Ok("S") -> count + 1
    _, _, _ -> count
  }
}

pub fn part_two(input: String) -> Int {
  let grid = build_grid(input)
  use count, #(row, col), chr <- dict.fold(grid, 0)
  use <- bool.guard(when: chr != "A", return: count)
  case
    dict.get(grid, #(row + 1, col + 1)),
    dict.get(grid, #(row - 1, col + 1)),
    dict.get(grid, #(row - 1, col - 1)),
    dict.get(grid, #(row + 1, col - 1))
  {
    Ok("M"), Ok("M"), Ok("S"), Ok("S")
    | Ok("S"), Ok("S"), Ok("M"), Ok("M")
    | Ok("M"), Ok("S"), Ok("S"), Ok("M")
    | Ok("S"), Ok("M"), Ok("M"), Ok("S")
    -> count + 1
    _, _, _, _ -> count
  }
}
