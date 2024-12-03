import day02
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn is_reliable_test() {
  let good_ascending = [16, 19, 20, 23, 26, 29, 30, 31]
  let good_descending = [83, 81, 78, 75, 74]
  let bad_ascending = [16, 19, 20, 23, 27, 29, 30, 31]
  let bad_descending = [83, 81, 77, 75, 74]
  let bad_dupes = [16, 16, 20, 23, 27, 29, 30, 31]
  let bad_trending_wrong = [16, 17, 20, 18, 19, 21]

  day02.is_reliable(good_ascending)
  |> should.equal(True)

  day02.is_reliable(good_descending)
  |> should.equal(True)

  day02.is_reliable(bad_ascending)
  |> should.equal(False)

  day02.is_reliable(bad_descending)
  |> should.equal(False)

  day02.is_reliable(bad_dupes)
  |> should.equal(False)

  day02.is_reliable(bad_trending_wrong)
  |> should.equal(False)
}

pub fn is_reliable_with_dampening_test() {
  day02.is_reliable_with_dampening([1, 3, 2, 4, 5])
  |> should.equal(True)

  day02.is_reliable_with_dampening([9, 7, 6, 2, 1])
  |> should.equal(False)
}

pub fn part_one_test() {
  let input =
    "7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9"
  day02.part_one(input)
  |> should.equal(2)
}
// pub fn part_two_test() {
//   let input =
//     "7 6 4 2 1
// 1 2 7 8 9
// 9 7 6 2 1
// 1 3 2 4 5
// 8 6 4 4 1
// 1 3 6 7 9"
//   day02.part_two(input)
//   |> should.equal(4)
// }
