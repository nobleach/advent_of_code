open OUnit2
open Day10

let matrix1 = [|
  [|'.' ; '7'|] ;
  [|'.' ; 'S'|]
|]

let matrix2 = [|
  [|'.' ; '7'; 'J'|] ;
  [|'.' ; 'S'; 'F'|] ;
  [| '|'; '|'; '-'|]
|]

let test_get_next_coords_and_direction_for_East_hyphen _ =
  assert_equal (East, 1, 0) (move (East, 0, 0 ) '-')

let test_get_next_coords_and_direction_for_North_pipe _ =
  assert_raises (Failure "Heading + Coordinates not supported") (fun () -> move (East, 0, 0 ) '|')

let test_find_starting_coords_finds_s_at_end _ =
  assert_equal (1, 1) (find_starting_coords matrix1 (0, 0))

let test_find_starting_coords_finds_s_in_middle _ =
  assert_equal (1, 1) (find_starting_coords matrix2 (0, 0))

let suite = "Day10TestList" >::: [ 
  "test_get_next_coords_and_direction_for_East_hyphen" >:: test_get_next_coords_and_direction_for_East_hyphen ;
  "test_get_next_coords_and_direction_for_North_pipe" >:: test_get_next_coords_and_direction_for_North_pipe ;
  "test_find_starting_coords_finds_s_at_end" >:: test_find_starting_coords_finds_s_at_end ;
  "test_find_starting_coords_finds_s_in_middle" >:: test_find_starting_coords_finds_s_in_middle
  ]

let () = run_test_tt_main suite

