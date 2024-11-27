import gleeunit
import gleeunit/should
import day06

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn parse_input_test() {
  day06.parse_input(
    "Time:      7  15   30
  Distance:  9  40  200
",
  )
  |> should.equal([#(7, 9), #(15, 40), #(30, 200)])
}

pub fn it_blows_up_test() {
  day06.parse_input(
    "Time:      7  j   30
  Distance:  9  40  200
",
  )
  |> should.equal([#(7, 9), #(15, 40), #(30, 200)])
}
