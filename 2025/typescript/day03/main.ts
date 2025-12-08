async function main() {
  const input = Bun.file("./input/input.txt");

  console.log(part1(await input.text()));
}

export function getHighestPair(input: string): number {
  const bankStringArray = input.trim().split("");
  const bankArray = bankStringArray.map((s) => Number(s));
  let maxVal = Math.max(...bankArray);
  let maxIndex = bankArray.findIndex((v) => v === maxVal);

  if (maxIndex === bankArray.length - 1) {
    const tempBank = bankArray.slice(0, -1);
    maxVal = Math.max(...tempBank);
    maxIndex = bankArray.findIndex((v) => v === maxVal);
  }

  const subBank = bankArray.slice(maxIndex + 1);
  const maxSecondaryVal = Math.max(...subBank);

  return maxVal * 10 + maxSecondaryVal;
}

export function part1(input: string): number {
  let joltage = 0;
  const lines = input.trim().split("\n");

  lines.forEach((bank) => {
    const bankJoltage = getHighestPair(bank);
    joltage += bankJoltage;
  });

  return joltage;
}

main();
