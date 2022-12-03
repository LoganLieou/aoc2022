(*
  part 1: want to take the sum of our "score" across each row

  think of like parse each row know the mapping of a hand

  A -> 1, B -> 2, C -> 3 etc.

  create some sort of matchup table and add that to the value of the hand
  i.e. outcome[yourhand][enemyhand] + value_of_your_hand

  outcome: on the left is your hand and on the top is enemy hand
  
     1 2 3
   1 3 0 6
   2 6 3 0
   3 0 6 3

  I ran into an issue where parsing the EOF character for some reason
  leading to lots of issue, probably a way to fix this too lazy to figure out
  so I just skip on 0 input
 *)

let hand_value (hand: string): int =
  match hand with
    | "X" | "A" -> 1
    | "Y" | "B" -> 2
    | "Z" | "C" -> 3
    | _ -> 0

let parse (s: string): int list list = String.split_on_char '\n' s 
  |> List.map @@ String.split_on_char ' '
  |> List.map @@ List.map @@ hand_value

let outcome: int array array = [|
  [|3;0;6|];
  [|6;3;0|];
  [|0;6;3|]
|]

let solve (s: string): int = parse s
  |> List.map (fun x ->
      if (List.nth x 0 <> 0) then 
        List.nth x 0 + outcome.(List.nth x 0 - 1).(List.nth x 1 - 1)
      else 0
     )
  |> List.fold_left (+) 0

let () =
  let ch = open_in "../input.txt" in
  print_endline(solve @@ really_input_string ch (in_channel_length ch) |> string_of_int)
