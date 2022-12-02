(* 
  pt1. calories:
  each elf is carrying some set of items which
  have calorie count k each item is seperated by "\n"
  and each elf is seperated by "\n\n"

  want to find:
  how many calories each elf is carrying then the max of
  all of the calories 
*)

(* parse then solve *)
let solve (s: string): int = Str.split (Str.regexp "\n\n") s
  |> List.map @@ Str.split @@ Str.regexp "\n"
  |> List.map @@ List.map int_of_string
  |> List.map @@ List.fold_left (+) 0
  |> List.fold_left max 0

(* main method solve the problem *)
let (): unit =
  let ch = open_in "../input.txt" in
  print_endline(solve @@ really_input_string ch (in_channel_length ch) |> string_of_int)

