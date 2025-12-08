async function main(): void {
  const input = Bun.file("./input/input.txt");
  console.log(part1(await input.text()));
  console.log(part2(await input.text()));
}

type DialResult = {
  newValue: number;
  zeroHits?: number;
};

export function getDialResult(
  prevValue: number,
  nextValue: number,
): DialResult {
  return { newValue: (prevValue + nextValue + 100) % 100 };
}

export function parseDialInput(input: string): number {
  const direction = input[0];
  const val = parseInt(input.slice(1), 10);

  if (direction === "R") {
    return val;
  } else if (direction === "L") {
    return -val;
  } else {
    throw new Error(`Invalid direction: ${direction}`);
  }
}

export function part1(input: string): number {
  let zeros = 0;
  let startingValue = 50;

  input.split("\n").forEach((line) => {
    if (line.trim() === "") return;
    const dialChange = parseDialInput(line.trim());
    const result = getDialResult(startingValue, dialChange);
    if (result.newValue === 0) zeros += 1;
    startingValue = result.newValue;
  });

  return zeros;
}

export function part2(input: string): number {}

main();
