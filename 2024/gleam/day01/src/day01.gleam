import gleam/int
import gleam/io
import gleam/list
import gleam/regexp
import gleam/result
import gleam/string
import simplifile

pub fn main() {
  let assert Ok(input) = simplifile.read("./src/input.txt")
  let part01 = process_lines(input)

  io.debug(part01)
}

pub fn get_nums_from_string(str: String) -> List(Int) {
  let assert Ok(re) = regexp.from_string("[0-9]")
  string.to_graphemes(str)
  |> list.filter(fn(g) { regexp.check(re, g) })
  |> list.map(fn(g) { int.parse(g) })
  |> result.values()
}

pub fn get_first_and_last_numbers(num_list: List(Int)) -> Int {
  let first = result.unwrap(list.first(num_list), 0)
  let last = result.unwrap(list.last(num_list), 0)

  first * 10 + last
}

pub fn process_lines(input: String) -> Int {
  string.split(input, "\n")
  |> list.fold(0, fn(acc, l) {
    get_nums_from_string(l) |> get_first_and_last_numbers |> int.add(acc)
  })
}
