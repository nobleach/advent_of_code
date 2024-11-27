open Day06

let () =
  let input = Core.In_channel.read_all "input.txt" in
  parse_input input |>
    List.map (fun td -> decide_winners td 1 []) 
    |> List.fold_left ( * ) 1
    |> Printf.printf "Product: %d\n";
  let lines = open_in "input.txt" |> In_channel.input_lines in
  let race = parse_without_kerning lines in
  Printf.printf "Kerned product: %d\n" (decide_winners race 1 [])


