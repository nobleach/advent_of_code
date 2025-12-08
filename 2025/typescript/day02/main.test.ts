import { describe, expect, it } from "vitest";
import { parseRange, part1, part2 } from "./main.ts";

describe("day02", () => {
  describe("part1", () => {
    it("parses a start/end range from a string", () => {
      const input = "11-22";

      const result = parseRange(input);

      expect(result).toEqual({ start: 11, end: 22 });
    });

    it("counts all invalid ids", () => {
      const input =
        "11-22,95-115,998-1012,1188511880-1188511890,222220-222224, 1698522-1698528,446443-446449,38593856-38593862,565653-565659, 824824821-824824827,2121212118-2121212124";
      const result = part1(input);

      expect(result).toEqual(1227775554);
    });
  });

  describe("part2", () => {});
});
