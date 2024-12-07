import gleam/bool
import gleam/dict.{type Dict}
import gleam/int
import gleam/io
import gleam/list
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import simplifile

pub fn main() {
  let assert Ok(input) = simplifile.read("./src/input.txt")
  io.debug(part_one(input))
  io.debug(part_two(input))
}

pub fn get_rules(input: String) {
  // 47 -> [53, 13, 61, 29]
  input
  |> string.split("\n\n")
  |> list.first()
  |> result.unwrap("")
  |> string.split("\n")
  |> list.fold(dict.new(), fn(rules, curr) {
    // 75|29
    let res = case string.split(curr, "|") {
      [hd, tl, ..] ->
        pair.new(
          result.unwrap(int.parse(hd), 0),
          result.unwrap(int.parse(tl), 0),
        )
      _ -> #(0, 0)
    }

    let append_or_insert = fn(x) {
      case x {
        option.Some(rules_list) -> list.append(rules_list, [pair.second(res)])
        option.None -> [pair.second(res)]
      }
    }

    dict.upsert(rules, pair.first(res), append_or_insert)
  })
}

pub fn get_midpoint_of_passing_reports(
  report: List(Int),
  rules: Dict(Int, List(Int)),
) -> Int {
  case report {
    [] | [_] ->
      report
      |> list.drop(list.length(report) / 2)
      |> list.first()
      |> result.unwrap(0)

    [hd, ..tl] -> {
      let assert Ok(rule) = dict.get(rules, hd)
      io.debug(tl)
      let assert Ok(snd) = list.first(tl)

      use <- bool.guard(
        when: list.contains(rule, snd),
        return: get_midpoint_of_passing_reports(tl, rules),
      )
      0
    }
  }
}

pub fn get_update_log(input: String) -> List(List(Int)) {
  input
  |> string.split("\n\n")
  |> list.last()
  |> result.unwrap("")
  |> string.split("\n")
  |> list.map(fn(xs) {
    string.split(xs, ",")
    |> list.map(int.parse)
    |> result.values
  })
}

pub fn part_one(input: String) {
  143
}

pub fn part_two(input: string) {
  todo
}
