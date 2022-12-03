(*
  XYZ determines if you need to lose win or draw, ABC is still rock paper scissors 
  now you must determine the scoreline

  now it's like outcome + value_of_your_hand

  need a table for value_of_your_hand

  left is enemy hand top is outcome:
   6 0 3
  1 2 3 1
  2 3 1 2
  3 2 1 3

  indexing is like
  value_of_your_hand[enemy_hand][outcome]
*)

let hand (s: string): int =
  match s with
    | "A" -> 1
    | "B" -> 2
    | "C" -> 3
    | "Z" -> 6
    | "X" -> 0
    | "Y" -> 3
    | _ -> -1

(* need this mapping because indexing matchup table goes 
   out of bounds otherwise

   this is p bad solution so in the future want to use custom type
   or something like that
 *)
let outcome_to_index (outcome: int): int =
  match outcome with
    | 6 -> 0
    | 0 -> 1
    | 3 -> 2
    | _ -> -1

(* matchup table *)
let hand_value = [|
  [|2;3;1|];
  [|3;1;2|];
  [|2;1;3|]
|]

let parse (s: string): int list list = String.split_on_char '\n' s 
  |> List.map @@ String.split_on_char ' '
  |> List.map @@ List.map hand

let solve (s: string): int = parse s
  |> List.map (fun x ->
      if (List.nth x 0) <> -1 then
        (List.nth x 1) + hand_value.(List.nth x 0 - 1).(outcome_to_index @@ List.nth x 1)
      else 0
    )
  |> List.fold_left (+) 0

let () =
  let ch = open_in "../input.txt" in
  print_endline(solve @@ really_input_string ch (in_channel_length ch) |> string_of_int)


