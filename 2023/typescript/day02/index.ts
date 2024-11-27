export function isGamePossible([color, count]: [string, number]): boolean {
  const max_red = 12;
  const max_green = 13;
  const max_blue = 14;

  if (color === "red") {
    return count <= max_red;
  }

  if (color === "green") {
    return count <= max_green;
  }

  if (color === "blue") {
    return count <= max_blue;
  }
}

export function getIdForPossibleGame(line: string): number {
  if (line === "") return 0;
  const scoresRe = new RegExp(/\d+\s\w+/gi);
  const scores = [...line.matchAll(scoresRe)].flat().map((p) => {
    const parts = p.split(" ");
    const count = parts.at(0);
    const color = parts.at(-1);

    return [color, count];
  });

  let id = 0;

  if (scores.every(isGamePossible)) {
    const re = new RegExp(/Game\s\d+/gi);
    const idMatch = [...line.match(re)].flat()?.[0].split(" ")[1];

    id = parseInt(idMatch);
  }

  return id;
}

export function sumAllLines(str: string): number {
  const lines = str.split("\n");

  return lines.reduce((sum, curr) => {
    return sum + getIdForPossibleGame(curr);
  }, 0);
}

const input = Bun.file("./input.txt");

console.log(sumAllLines(await input.text()));
