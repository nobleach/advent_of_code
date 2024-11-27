import { Matrix } from ".";

it("returns the next value in a matrix", () => {
  const input = `467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..`;

  const matrix = new Matrix(input);

  expect(matrix.next()).toBe("4");
});

it("continues on the next line", () => {
  const input = `4.
2*`;

  const matrix = new Matrix(input);

  expect(matrix.next()).toBe("4");
  expect(matrix.next()).toBe(".");
  expect(matrix.next()).toBe("2");
  expect(matrix.next()).toBe("*");
});
