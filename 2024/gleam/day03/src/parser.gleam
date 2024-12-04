import gleam/int
import gleam/io
import gleam/string
import party

type Mul {
  Mul(x: Int, y: Int)
}

pub fn main() {
  let int_parser = {
    use digits <- party.do(party.digits())
    let number = string.concat([digits])

    case int.parse(number) {
      Ok(int) -> party.return(int)
      Error(_) -> party.fail()
    }
  }

  let parser = {
    use _ <- party.do(party.string("mul("))
    use _ <- party.do(party.whitespace())
    use x <- party.do(int_parser)
    use _ <- party.do(party.whitespace())
    use _ <- party.do(party.char(","))
    use _ <- party.do(party.whitespace())
    use y <- party.do(int_parser)
    use _ <- party.do(party.whitespace())
    use _ <- party.do(party.char(")"))

    party.return(Mul(x, y))
  }

  let input = string.to_graphemes("mul(1, 2)")
  let assert Ok(mul) = party.run(parser, input, party.Position(1, 1))

  io.debug({ mul.0 }.x)
  //=> 1
  io.debug({ mul.0 }.y)
  //=> 2
}
