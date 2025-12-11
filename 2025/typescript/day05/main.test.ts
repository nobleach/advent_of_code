import { describe, expect, it } from "vitest";
import { part1 } from "./main";

describe("day05", () => {
  describe("part1", () => {
    it("returns the number of fresh ingredients", () => {
      const input = `3-5
10-14
16-20
12-18

1
5
8
11
17
32`;
      const result = part1(input);

      expect(result).toBe(3);
    });
  });
});
