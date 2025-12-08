import { describe, it, expect } from "vitest";
import { getDialResult, parseDialInput } from "./main";

describe("Day 01", () => {
  describe("parseDialInput", () => {
    it("should parse the dial input for a right-hand turn", () => {
      const result = parseDialInput("R30");

      expect(result).toEqual(30);
    });

    it("should parse the dial input for a left-hand turn", () => {
      const result = parseDialInput("L42");

      expect(result).toEqual(-42);
    });
  });

  describe("getDialResult", () => {
    it("should generate the correct dial sequence for a given input", () => {
      const result1 = getDialResult(50, -30); // 20
      const result2 = getDialResult(result1.newValue, -20); // 0
      const result3 = getDialResult(result2.newValue, -25); // 75

      expect(result3.newValue).toEqual(75);
    });

    it("should wrap around correctly for greater than 99 values", () => {
      const result1 = getDialResult(90, 15); // 5
      expect(result1.newValue).toEqual(5);
    });
  });
});
