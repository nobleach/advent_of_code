export function* getDirection(directions: Array<string>) {
  let pointer = 0;

  while (pointer < directions.length) {
    yield directions[pointer];

    if (pointer === 2) {
      pointer = 0;
    } else {
      pointer += 1;
    }
  }
}
