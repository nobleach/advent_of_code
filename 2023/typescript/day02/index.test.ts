import { getIdForPossibleGame, isGamePossible } from "./index.ts";

it("it returns false for green greater than 12", () => {
  const actual = isGamePossible(["green", 20]);

  expect(actual).toBe(false);
});

it("returns a numeric value for a possible line", () => {
  const input = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green";

  const actual = getIdForPossibleGame(input);

  expect(actual).toBe(1);
});

it("returns a numeric zero for an impossible line", () => {
  const input =
    "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red";

  const actual = getIdForPossibleGame(input);

  expect(actual).toBe(0);
});
