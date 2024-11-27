let split_to_array s = Array.init (String.length s) (String.get s)

(* let lines = open_in "input.test.txt" |> In_channel.input_lines |> List.map split_to_array |> Array.of_list *)

let build_matrix_from_lines lines =
  lines 
  |> List.map split_to_array
  |> Array.of_list

(* the direction we're heading *)
type heading = North | South | East | West [@@deriving show]

let move curr_coords next_move_symbol =
  let (heading, x, y) = curr_coords in
    match heading, next_move_symbol with
    | North, '7' -> (West, x -1, y - 1)
    | North, '|' -> (North, x, y - 1)
    | North, 'F' -> (North, x + 1, y - 1)
    | East, '-' -> (East, x + 1, y)
    | East, 'J' -> (North, x + 1, y - 1)
    | East, '7' -> (South, x + 1, y + 1)
    | South, 'J' -> (West, x - 1, y + 1)
    | South, '|' -> (South, x, y + 1)
    | South, 'L' -> (East, x + 1, y + 1)
    | West, 'L' -> (North, x - 1, y - 1)
    | West, '-' -> (West, x - 1, y)
    | West, 'F' -> (South, x - 1, y + 1)
    | _ -> failwith "Heading + Coordinates not supported"

let rec find_starting_coords matrix coord =
  let (y, x) = coord in
    let row_length = Array.length matrix.(y) - 1 in
      match matrix.(y).(x), x with
        | 'S', _ -> coord
        | _, x when x = row_length  -> find_starting_coords matrix (y + 1, 0)
        | _, _ -> find_starting_coords matrix (y, x + 1)

(* Peek
  North -> '7', '|', 'F'
  East -> '-', 'J', '7'
  South -> 'J', '|', 'L'
 *)
