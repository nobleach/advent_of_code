export async function main() {
	const input = Bun.file("./src/input.txt");
	console.log(partOne(await input.text()));
}

export function parseToMap(input: string): Map<[number, number], string> {
	const lines = input.split("\n");
	const charMap = new Map<[number, number], string>();

	return lines.reduce((acc, curr, row) => {
		const chars = curr.split("");

		chars.forEach((val, col) => {
			acc.set([row, col], val);
		});
		return acc;
	}, charMap);
}

export function partOne(input: string): number {}

export function partTwo(input: string): number {}
