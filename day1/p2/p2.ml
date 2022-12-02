(* pt.2 find the sum of the 3 largest calories *)
(* parse the file *)
let parse (s: string): int list = Str.split (Str.regexp "\n\n") s
  |> List.map (String.split_on_char '\n')
  |> List.map (List.map (int_of_string))
  |> List.map (List.fold_left (+) 0)

(* sort in decreasing order *)
let cmp (x: 'a) (y: 'a): int =
  if x > y then -1 else if x == y then 0 else 1

(* find the sum of calories of the top 3 elves *)
let solve (s: string): int = List.sort cmp (parse s) |> function
  | a :: b :: c :: _ -> a + b + c
  | _ -> 0
  
(* main method solves all *)
let () =
  let ch = open_in "../input.txt" in
  print_endline (really_input_string ch (in_channel_length ch) |> solve |> string_of_int)
