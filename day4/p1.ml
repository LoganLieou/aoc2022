(* how many assignment pairs does one fully contain another *)
(* pairs can be parsed as follows 
   start_of_interval1-end_of_interval1,start_of_interval2-end_of_interval2
 *)

(* [[1,2][3,4]] *)
let parse (s: string): int list list = String.split_on_char ',' s
  |> List.map @@ String.split_on_char '-'
  |> List.map @@ List.map @@ int_of_string

(* the statement of weather or not an interval is fully in another *)
let fully_in (fst: int list) (snd: int list): bool =
  (* need condition for this *)
  if List.nth fst 0 < List.nth snd 0 || List.nth fst 1 > List.nth snd 1 then
    true
  else
    false

let solve (s: string): bool = parse s
  |> fun lst ->
      let first_interval = List.nth lst 0 in
      let second_interval = List.nth lst 1 in
      if (fully_in first_interval second_interval) then
        true
      else
        false

let () =
  let ch = open_in "input.txt" in
  let r = ref 0 in
  (* multiparadigmed *)
  try
    while true; do
      if (solve @@ input_line ch) then
        r := !r + 1
    done;
  with End_of_file ->
    close_in ch;
    print_endline(string_of_int !r)


