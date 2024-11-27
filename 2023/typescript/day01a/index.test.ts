import { expect, it } from "bun:test";
import { getPairsAsInt, sumAllLines } from ".";

it("parses a 2 digit number out of a string", () => {
  const actual = getPairsAsInt("1abc2");

  expect(actual).toBe(12);
});

it("parses a 2 digit number out of a string with only one number", () => {
  const actual = getPairsAsInt("treb7uchet");

  expect(actual).toBe(77);
});

it("returns the sum of all lines", () => {
  const input = `1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet`;

  const actual = sumAllLines(input);

  expect(actual).toBe(142);
});
