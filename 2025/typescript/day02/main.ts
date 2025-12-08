async function main() {
  const input = Bun.file("./input/input.txt");

  console.log(part1(await input.text()));
}

type IdRange = {
  start: number;
  end: number;
};

export function parseRange(input: string): IdRange {
  const [start, end] = input.trim().split("-");

  return { start: Number(start), end: Number(end) };
}

export function part1(input: string): number {
  let invalidIds = 0;
  const rangeStrings = input.trim().split(",");

  for (const rangeString of rangeStrings) {
    const range = parseRange(rangeString);

    for (let i = range.start; i <= range.end; i++) {
      const midPoint = i.toString().length / 2;
      const firstHalf = i.toString().slice(0, midPoint);
      const secondHalf = i.toString().slice(midPoint);

      if (firstHalf === secondHalf) {
        invalidIds += i;
      }
    }
  }

  return invalidIds;
}

export function part2() {}

main();
