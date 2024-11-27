let parse_input input = 
  let splits = input |> Str.split (Str.regexp "\n") in
  let parts = (List.nth splits 0) 
      |> Str.split (Str.regexp "[ \n\r\x0c\t]+") 
      |> List.tl 
      |> List.map int_of_string,
  (List.nth splits 1) 
      |> Str.split (Str.regexp "[ \n\r\x0c\t]+") 
      |> List.tl 
      |> List.map int_of_string
  in let durations, distances = parts in 
    List.combine durations distances

let parse_without_kerning input = 
    let data = input
             |> List.map (fun line -> Str.bounded_split (Str.regexp " +") line 2)
             |> List.map List.tl
             |> List.flatten
             |> List.map (Str.global_replace (Str.regexp " +") "")
             |> List.map int_of_string
    in match data with
    | [time; distance] -> (time, distance)
    | _                -> failwith "parse_failure"


let rec decide_winners td hold_time res =
  let duration, distance_to_beat = td in
    match (duration - hold_time) * hold_time with
    | 0 -> List.length res
    | w when (w < distance_to_beat) -> decide_winners td (hold_time + 1) res
    | w when (w > distance_to_beat) -> decide_winners td (hold_time + 1) (List.cons hold_time res)
    | _ -> List.length res
    
