import day01
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn hello_world_test() {
  1
  |> should.equal(1)
}

pub fn sort_input_test() {
  day01.sort_input_as_ints(["3", "4", "2", "1", "3", "3"])
  |> should.equal([1, 2, 3, 3, 3, 4])
}

pub fn get_frequency_test() {
  day01.get_frequency([4, 3, 5, 3, 9, 3], 3)
  |> should.equal(3)
}

pub fn part_one_test() {
  let input =
    "3   4
4   3
2   5
1   3
3   9
3   3"
  day01.part_one(input)
  |> should.equal(11)
}

pub fn part_two_test() {
  let input =
    "3   4
4   3
2   5
1   3
3   9
3   3"
  day01.part_two(input)
  |> should.equal(31)
}
