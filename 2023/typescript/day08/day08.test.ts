import { expect, test } from "bun:test";
import { getDirection } from "./day08";

test("It gives the next value", () => {
  const directions = ["1", "2", "3"];
  let d = getDirection(directions);
  expect(d.next().value).toBe("1");
});

test("It loops back around to the first element", () => {
  const directions = ["1", "2", "3"];
  let d = getDirection(directions);
  d.next();
  d.next();
  d.next();
  expect(d.next().value).toBe("1");
  expect(d.next().value).toBe("2");
});
