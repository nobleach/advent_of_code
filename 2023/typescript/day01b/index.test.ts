import { expect, it } from "bun:test";
import { getPairsAsInt, sumAllLines } from ".";

it("parses a 2 digit number out of a string", () => {
  const actual = getPairsAsInt("two1nine");

  expect(actual).toBe(29);
});

it("handles a long weird one", () => {
  const actual = getPairsAsInt("seightwoone8qxcfgszninesvfcnxc68");

  expect(actual).toBe(88);
});

it("handles twoone", () => {
  const actual = getPairsAsInt("nctwonefourjzgskmxjmq2");

  expect(actual).toBe(22);
});

it("handles oneight", () => {
  const actual = getPairsAsInt("ggkvsljtddcmznlxlqb4one32oneightppn");

  expect(actual).toBe(48);
});

it("parses a 2 digit number out of a string with digit and string", () => {
  const actual = getPairsAsInt("zoneight234");

  expect(actual).toBe(14);
});

it("returns the sum of all lines", () => {
  const input = `two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen`;

  const actual = sumAllLines(input);

  expect(actual).toBe(281);
});
