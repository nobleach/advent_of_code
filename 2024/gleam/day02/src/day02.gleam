import gleam/int
import gleam/io
import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn main() {
  let assert Ok(input) = simplifile.read("./src/input.txt")
  io.debug(part_one(input))
  io.debug(part_two(input))
}

pub fn is_reliable(levels: List(Int)) -> Bool {
  let range =
    levels
    |> list.zip(list.drop(levels, 1))
    |> list.map(fn(p) { p.1 - p.0 })

  list.all(range, fn(n) { n > 0 && n <= 3 })
  || list.all(range, fn(n) { n >= -3 && n < 0 })
}

pub fn part_one(input: String) {
  input
  |> string.trim_end()
  |> string.split("\n")
  |> list.map(fn(s) {
    string.split(s, " ") |> list.map(int.parse) |> result.values
  })
  |> list.count(is_reliable)
}

pub fn is_reliable_with_dampening(line: List(Int)) -> Bool {
  line
  |> list.combinations(list.length(line) - 1)
  |> list.any(is_reliable)
}

pub fn part_two(input: String) {
  input
  |> string.trim_end()
  |> string.split("\n")
  |> list.map(fn(s) {
    string.split(s, " ") |> list.map(int.parse) |> result.values
  })
  |> list.count(is_reliable_with_dampening)
}
