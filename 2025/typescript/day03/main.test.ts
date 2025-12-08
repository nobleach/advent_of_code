import { describe, expect, it } from "vitest";
import { getHighestPair, part1 } from "./main";

describe("day02", () => {
  describe("part1", () => {
    it("gets highest pair from ordered string", () => {
      const input = "987654321111111";

      const result = getHighestPair(input);

      expect(result).toEqual(98);
    });

    it("gets highest pair from a string with max on end", () => {
      const input = "234234234234278";

      const result = getHighestPair(input);

      expect(result).toEqual(78);
    });

    it("gets maximum joltage for all banks", () => {
      const input = `987654321111111
811111111111119
234234234234278
818181911112111`;

      const result = part1(input);

      expect(result).toEqual(357);
    });
  });
});
