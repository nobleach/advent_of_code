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

pub fn part_one(input: String) {
  todo
  // build a Dict(Dict(Int)) to represent the grid
}

pub fn part_two(input: String) -> Int {
  todo
}
