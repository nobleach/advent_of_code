open Core
open Pcre

let is_game_possible (color, count) =
  let color_max =
    match color with
      | "red" -> 12
      | "green" -> 13
      | "blue" -> 14
      | _ -> 0 in

  match count with
    | count when (count > color_max) -> false
    | _ -> true
    
let get_game_id_for_possible_game line =
    let rex = Pcre.regexp {|(\d+\s\w+)+|} in 
      let substrings = Pcre.exec ~rex line |> Pcre.get_substrings in 
        let pairs = Array.map ~f:(fun substring -> Scanf.sscanf substring "%i %s" (fun count color -> (color, count))) substrings in
        Array.for_all ~f:is_game_possible pairs 

let sum_all_scores _ = 3

let () =
  let input = In_channel.read_all "input.txt" in
  let summed = sum_all_scores input in
  printf "Sum all lines: %d\n" summed
