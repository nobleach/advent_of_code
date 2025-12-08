import gleeunit
import gleeunit/should
import day01

pub fn main() -> Nil {
  gleeunit.main()
}

// Test the parse_input_to_number function
pub fn parse_input_to_number_test() {
  // Test with a simple number
  day01.parse_input_to_number("123")
  |> should.equal(123)

  // Test with mixed characters
  day01.parse_input_to_number("abc123def456")
  |> should.equal(123456)

  // Test with no numbers
  day01.parse_input_to_number("abcdef")
  |> should.equal(0)
}
