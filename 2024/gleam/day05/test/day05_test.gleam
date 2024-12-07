import day05
import gleam/dict
import gleam/io
import gleam/list
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn part_one_test() {
  let input =
    "47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47"

  day05.part_one(input)
  |> should.equal(143)
}

pub fn get_update_log_test() {
  let input =
    "47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47"
  day05.get_update_log(input)
  |> list.first()
  |> should.equal(Ok([75, 47, 61, 53, 29]))
}

pub fn get_rules_test() {
  let input =
    "47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47"

  let actual = day05.get_rules(input)
  dict.get(actual, 75)
  |> should.equal(Ok([29, 53, 47, 61, 13]))
}

pub fn get_midpoint_of_passing_reports_test() {
  let rules =
    dict.from_list([
      #(29, [13]),
      #(47, [53, 13, 61, 29]),
      #(53, [29, 13]),
      #(61, [13, 53, 29]),
      #(75, [29, 53, 47, 61, 13]),
      #(97, [13, 61, 47, 29, 53, 75]),
    ])

  day05.get_midpoint_of_passing_reports([75, 47, 61, 53, 29], rules)
  |> should.equal(61)
}
