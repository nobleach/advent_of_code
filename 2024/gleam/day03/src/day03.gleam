import gleam/int
import gleam/io
import gleam/list
import gleam/option
import gleam/regexp
import gleam/result
import gleam/string
import simplifile

pub fn main() {
  let assert Ok(input) = simplifile.read("./src/input.txt")
  io.debug(part_one(input))
  io.debug(part_two(input))
}

fn multiply_submatches(match: regexp.Match) -> Int {
  let assert [fst, lst] =
    match.submatches
    |> list.map(fn(submatch) {
      case submatch {
        option.Some(n) -> n |> int.parse |> result.unwrap(0)
        option.None -> 0
      }
    })

  int.multiply(fst, lst)
}

pub fn parse_and_multiply(line: String) -> Int {
  let assert Ok(mult_re) =
    regexp.from_string("mul\\(([0-9]{1,3}),([0-9]{1,3})\\)")

  line
  |> regexp.scan(with: mult_re)
  |> list.map(multiply_submatches)
  |> int.sum
}

pub fn part_one(input: String) -> Int {
  let input = string.replace(input, "\n", "")
  input
  |> string.trim_end()
  |> parse_and_multiply
}

pub fn part_two(input: String) -> Int {
  let input = string.replace(input, "\n", "")
  let assert Ok(noop) = regexp.from_string("don't\\(\\)(.*?)(?=do\\(\\)|$)")
  let filtered = regexp.replace(each: noop, in: input, with: "")
  filtered
  |> string.trim_end()
  |> parse_and_multiply
}
