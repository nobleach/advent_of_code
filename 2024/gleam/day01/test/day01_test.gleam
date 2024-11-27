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

pub fn get_nums_from_string_test() {
  day01.get_nums_from_string("1abc2")
  |> should.equal([1, 2])

  day01.get_nums_from_string("treb7uchet")
  |> should.equal([7])
}

pub fn get_first_and_last_numbers_test() {
  day01.get_first_and_last_numbers([1, 2])
  |> should.equal(12)

  day01.get_first_and_last_numbers([2, 4, 9, 5])
  |> should.equal(25)

  day01.get_first_and_last_numbers([7])
  |> should.equal(77)
}

pub fn process_lines_test() {
  let input =
    "
1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
    "
  day01.process_lines(input)
  |> should.equal(142)
}