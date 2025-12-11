async function main() {
  const input = Bun.file("./input/input.txt");

  console.log(part1(await input.text()));
}

export function part1(input: string): number {
  let freshIngredients = 0;
  const [rawRanges, rawIngredients] = input.trim().split("\n\n");
  const ingredients = rawIngredients
    .trim()
    .split("\n")
    .map((i) => Number(i));

  const ranges = rawRanges
    .trim()
    .split("\n")
    .map((r) => {
      const [lowerStr, upperStr] = r.trim().split("-");

      return {
        floor: Number(lowerStr),
        ceiling: Number(upperStr),
      };
    });

  ingredients.forEach((ing) => {
    for (let i = 0; i < ranges.length; i++) {
      const rng = ranges[i];
      if (ing >= rng.floor && ing <= rng.ceiling) {
        freshIngredients += 1;
        break;
      }
    }
  });

  return freshIngredients;
}

main();
