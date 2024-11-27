export function sumAllLines(str: string): number {
  const lines = str.split("\n");

  return lines.reduce((sum, curr) => {
    return sum + getPairsAsInt(curr);
  }, 0);
}

export function getPairsAsInt(line: string): number {
  const numbers = line
    .split("")
    .filter((c) => c.charCodeAt(0) >= 48 && c.charCodeAt(0) <= 57);

  if (numbers.length === 0) {
    return 0;
  }

  if (numbers.length === 1) {
    return parseInt(`${numbers[0]}${numbers[0]}`);
  }

  return parseInt(`${numbers[0]}${numbers[numbers.length - 1]}`);
}

const input = Bun.file("./input.txt");

console.log(sumAllLines(await input.text()));
