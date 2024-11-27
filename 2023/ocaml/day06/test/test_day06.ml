open OUnit2
open Day06

let input = "Time:      7  15   30\nDistance:  9  40  200"
let input2 = ["Time:      7  15   30" ; "Distance:  9  40  200"]

let test_parse_into_list_of_distance_time_tuples _ =
  assert_equal [(7, 9); (15, 40); (30, 200)] (parse_input input)

let test_decide_winners _ =
  assert_equal 4 (decide_winners (7, 9) 1 [])

let test_parse_without_kerning _ =
  assert_equal (71530, 940200) (parse_without_kerning input2)

let suite = "Day06TestList" >::: [ 
  "test_parse_into_list_of_distance_time_tuples" >:: test_parse_into_list_of_distance_time_tuples ;
  "test_decide_winners" >:: test_decide_winners;
  "test_parse_without_kerning" >:: test_parse_without_kerning
  ]

let () = run_test_tt_main suite
