import gleam/regex
import gleam/string
import gleam/result
import gleam/list
import gleam/int

fn pull_digits_from_match(match: regex.Match) -> Int {
  let regex.Match(content: first, ..) = match
  let assert Ok(i) = int.parse(first)
  i
}

fn wins_race(hold_time: Int, distance: Int) -> Bool {
  todo
}

pub fn parse_input(str: String) -> List(#(Int, Int)) {
  let #(times, distances) =
    result.unwrap(string.split_once(str, "\n"), #("", ""))
  let assert Ok(re) = regex.from_string("(\\d+)")

  let times_result =
    regex.scan(with: re, content: times)
    |> list.map(pull_digits_from_match)

  let distances_result =
    regex.scan(with: re, content: distances)
    |> list.map(pull_digits_from_match)

  list.zip(times_result, distances_result)
}
