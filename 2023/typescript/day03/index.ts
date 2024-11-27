type Coordinate = {
  x: number;
  y: number;
};

export class Matrix {
  private board: Array<Array<string>> = [];
  private height: number;
  private width: number;
  private cursor: Coordinate = { x: 0, y: 0 };

  constructor(str: string) {
    const lines = str.split("\n");
    this.height = lines.length;
    this.width = lines[0].length;

    lines.forEach((line) => {
      this.board.push(line.split(""));
    });
  }

  public getCursor(): Coordinate {
    return this.cursor;
  }

  public getHeight(): number {
    return this.height;
  }

  public getWidth(): number {
    return this.width;
  }

  public getValueAtCoordinate(coord: Coordinate): string {
    if (this.board && this.board[coord.y][coord.x]) {
      return this.board[coord.y][coord.x];
    }

    return "";
  }

  /**
   * next
   */
  public next(): string {
    const val = this.getValueAtCoordinate(this.getCursor());

    // if we've reached the end of a line,
    // traverse to the next, unless we've
    // run out of lines
    if (this.cursor.x === this.width && this.cursor.y < this.height) {
      this.cursor.y += 1;
      this.cursor.x = 0;

      const nextLineVal = this.getValueAtCoordinate(this.getCursor());

      // Increment for next time
      this.cursor.x += 1;

      return nextLineVal;
    }

    // Increment for next time
    this.cursor.x += 1;

    return val;
  }
}

const part1SymbolSet = new Set<string>([
  "!",
  "@",
  "#",
  "$",
  "%",
  "^",
  "&",
  "*",
  "/",
  ",",
]);

const visited = new Set<Coordinate>();
const allParts: Array<number> = [];

export function findAdjacentNumbers(m: Matrix) {}

export function sumAllPartNums(str: string): number {
  const m = new Matrix(str);

  while (m.getCursor().y < m.getHeight() && m.getCursor().x <= m.getWidth()) {
    if (part1SymbolSet.has(m.next())) {
      // traverse current and previous line for numbers
    }
  }
}

// const input = Bun.file("./input.txt");
// console.log(sumAllPartNums(await input.text()));
