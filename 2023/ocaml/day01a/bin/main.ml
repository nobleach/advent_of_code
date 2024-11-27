open Core
(* open Str *)

let rec sum = function
  | [] -> 0
  | h::t -> h + (sum t);;

let get_num_from_string s =
  let fst, lst =
    String.get s (Str.search_forward (Str.regexp "[0-9]") s 0),
    String.get s (Str.search_backward (Str.regexp "[0-9]") s (String.length s)) in
      int_of_string(Char.to_string fst) * 10 + int_of_string(Char.to_string lst)

let sum_all_lines input =
      Str.split (Str.regexp "\n") input
      |> List.map ~f:get_num_from_string 
      |> sum;;

let () =
  let input = In_channel.read_all "input.txt" in
  let summed = sum_all_lines input in
  printf "Sum all lines: %d\n" summed
