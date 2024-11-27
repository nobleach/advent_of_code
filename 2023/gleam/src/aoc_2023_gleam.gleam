import simplifile
import gleam/result
import gleam/io
import day06

pub fn main() {
  let contents = simplifile.read("./src/input.txt")
  day06.parse_input(result.unwrap(contents, ""))
}
