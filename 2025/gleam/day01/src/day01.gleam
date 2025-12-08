import gleam/io
import gleam/string
import gleam/int
import gleam/list

pub fn main() -> Nil {
  io.println("Hello from day01!")
}

/// Parses a string and extracts only the numeric characters,
/// then converts them to an integer.
///
pub fn parse_input_to_number(input: String) -> Int {
  // Convert string to list of graphemes (characters)
  let chars = string.to_graphemes(input)

  // Filter out non-digit characters and keep only digits
  let digits = list.filter(chars, fn(char) {
    string.contains("0123456789", char)
  })

  // Join the digits back into a string
  let digits_string = string.concat(digits)

  // Convert the string of digits to an integer
  case int.parse(digits_string) {
    Ok(number) -> number
    Error(_) -> 0  // Return 0 if parsing fails
  }
}
