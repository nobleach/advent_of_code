import { parseToMap } from "../src/day04";

describe("Day04", () => {
	it("builds a Map of coordinates -> values", () => {
		const input = `MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX`;
		const actual = parseToMap(input);
		expect(actual.get([0, 0])).toBe("M");
	});
});
