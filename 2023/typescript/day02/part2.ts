export function getProductForFewestCubes(line: string): number {
  if (line === "") return 0;
  const scoresRe = new RegExp(/\d+\s\w+/gi);
  console.log("####################################################");
  const scores = [...line.matchAll(scoresRe)].flat().map((p) => {
    const parts = p.split(" ");
    const count = parseInt(parts.at(0));
    const color = parts.at(-1);

    return [color, count];
  });

  const colorMaxes = new Map<string, number>([
    ["red", 0],
    ["green", 0],
    ["blue", 0],
  ]);

  scores.forEach((pair) => {
    console.log("current pair", pair);
    const current_color_max = colorMaxes.get(pair[0]);
    console.log("current max for that pair", current_color_max);
    if (pair[1] > current_color_max) {
      console.log("setting a new max");
      colorMaxes.set(pair[0], pair[1]);
    }
  });

  const allMaxes = [...colorMaxes.values()];

  return allMaxes.reduce((product: number, curr: number) => {
    return product * curr;
  }, 1);
}

export function sumAllLines(str: string): number {
  const lines = str.split("\n");

  return lines.reduce((sum, curr) => {
    return sum + getProductForFewestCubes(curr);
  }, 0);
}

const input = Bun.file("./input.txt");

console.log(sumAllLines(await input.text()));
