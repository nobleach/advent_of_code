import day03
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn parse_and_multiply_test() {
  let input =
    "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"

  day03.parse_and_multiply(input)
  |> should.equal(161)
}

pub fn part_one_test() {
  let input =
    "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"

  day03.part_one(input)
  |> should.equal(161)
}

pub fn part_two_test() {
  let input =
    "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"

  day03.part_two(input)
  |> should.equal(48)
}
