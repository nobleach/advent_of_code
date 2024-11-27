export function sumAllLines(str: string): number {
  const lines = str.split("\n");

  return lines.reduce((sum, curr) => {
    return sum + getPairsAsInt(curr);
  }, 0);
}

export function getPairsAsInt(line: string): number {
  const numberMap = new Map<string, number>();
  numberMap.set("one", 1);
  numberMap.set("two", 2);
  numberMap.set("three", 3);
  numberMap.set("four", 4);
  numberMap.set("five", 5);
  numberMap.set("six", 6);
  numberMap.set("seven", 7);
  numberMap.set("eight", 8);
  numberMap.set("nine", 9);

  const positionMap = new Map<number, string>();
  const numbers = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
  ];

  numbers.forEach((n) => {
    const idx = line.indexOf(n);
    const lastIdx = line.lastIndexOf(n);

    if (idx !== -1) {
      positionMap.set(idx, n);
    }

    if (lastIdx !== -1) {
      positionMap.set(lastIdx, n);
    }
  });

  const positions = [...positionMap.keys()].sort((a, b) => a - b);
  const matches = positions.map((p) => positionMap.get(p));

  const allNumbers = matches.map((m) => {
    if (numberMap.has(m)) {
      return numberMap.get(m);
    }

    return parseInt(m);
  });

  let result = 0;
  if (allNumbers.length === 0) result = 0;
  if (allNumbers.length === 1) {
    result = allNumbers[0] * 10 + allNumbers[0];
  }
  if (allNumbers.length > 1) {
    result = allNumbers[0] * 10 + allNumbers.at(-1);
  }

  return result;
}

const input = Bun.file("./input.txt");

console.log(sumAllLines(await input.text()));
