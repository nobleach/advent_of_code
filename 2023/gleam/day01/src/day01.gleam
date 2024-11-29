import gleam/dict
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
  let part02 = process_lines2(input)

  io.debug(part01)
  io.debug(part02)
}

pub fn get_nums_from_string(str: String) -> List(Int) {
  let assert Ok(re) = regexp.from_string("[0-9]")
  string.to_graphemes(str)
  |> list.filter(fn(g) { regexp.check(re, g) })
  |> list.map(fn(g) { int.parse(g) })
  |> result.values()
}

pub fn get_nums_from_string2(str: String) -> Int {
  let num_dict =
    dict.from_list([
      #("0", 0),
      #("1", 1),
      #("2", 2),
      #("3", 3),
      #("4", 4),
      #("5", 5),
      #("6", 6),
      #("7", 7),
      #("8", 8),
      #("9", 9),
      #("zero", 0),
      #("one", 1),
      #("two", 2),
      #("three", 3),
      #("four", 4),
      #("five", 5),
      #("six", 6),
      #("seven", 7),
      #("eight", 8),
      #("nine", 9),
    ])
  let assert Ok(f_re) =
    regexp.from_string(dict.keys(num_dict) |> string.join("|"))
  let assert Ok(b_re) =
    regexp.from_string(
      dict.keys(num_dict) |> string.join("|") |> string.reverse,
    )

  let f_scan = regexp.scan(f_re, str)
  let b_scan = regexp.scan(b_re, str |> string.reverse)
  case f_scan, b_scan {
    [fwd, ..], [back, ..] -> {
      let assert Ok(first) = num_dict |> dict.get(fwd.content)
      let assert Ok(last) = num_dict |> dict.get(back.content |> string.reverse)

      first * 10 + last
    }
    _, _ -> 0
  }
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

pub fn process_lines2(input: String) -> Int {
  string.split(input, "\n")
  |> list.fold(0, fn(acc, l) { get_nums_from_string2(l) |> int.add(acc) })
}
