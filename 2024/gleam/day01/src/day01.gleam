import gleam/int
import gleam/io
import gleam/list
import gleam/pair
import gleam/result
import gleam/string

import simplifile

pub fn main() {
  let assert Ok(input) = simplifile.read("./src/input.txt")
  io.debug(part_one(input))
  io.debug(part_two(input))
}

pub fn sort_input_as_ints(input: List(String)) -> List(Int) {
  input
  |> list.map(int.parse)
  |> result.values
  |> list.sort(int.compare)
}

pub fn get_int_columns(input: String) -> #(List(Int), List(Int)) {
  string.split(input, "\n")
  |> list.map(fn(l) { string.split(l, "   ") })
  |> list.map(fn(l) {
    let assert Ok(fst) = list.first(l)
    let assert Ok(lst) = list.last(l)
    pair.new(fst, lst)
  })
  |> list.unzip
  |> pair.map_first(fn(l) { sort_input_as_ints(l) })
  |> pair.map_second(fn(l) { sort_input_as_ints(l) })
}

pub fn get_frequency(haystack: List(Int), needle: Int) -> Int {
  haystack
  |> list.filter(fn(a) { a == needle })
  |> list.length
}

pub fn part_one(input: String) -> Int {
  let res = get_int_columns(input)

  list.map2(pair.first(res), pair.second(res), fn(a, b) {
    int.absolute_value(a - b)
  })
  |> int.sum
}

pub fn part_two(input: String) -> Int {
  let res = get_int_columns(input)

  list.map2(pair.first(res), pair.second(res), fn(a, _) {
    a * get_frequency(pair.second(res), a)
  })
  |> int.sum
}
