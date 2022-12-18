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

type game = Win | Draw | Loss | Rock | Paper | Scissor | GameError

let outcome_mapping (g: game): int =
  match g with
    | Win -> 6
    | Draw -> 3
    | Loss -> 0
    | _ -> -1

let character_mappings (s: string): game = 
  match s with
    | "X" -> Loss
    | "Y" -> Draw
    | "Z" -> Win
    | "A" -> Rock
    | "B" -> Paper
    | "C" -> Scissor
    | _ -> GameError

let game_to_index (g: game): int =
  match g with
    | Win -> 0
    | Loss -> 1
    | Draw -> 2
    | Rock -> 0
    | Paper -> 1
    | Scissor -> 2
    | GameError -> -1

(* matchup table *)
let hand_value = [|
  [|2;3;1|];
  [|3;1;2|];
  [|2;1;3|]
|]

(* parse into game type list list *)
let parse (s: string): game list list = String.split_on_char '\n' s 
  |> List.map @@ String.split_on_char ' '
  |> List.map @@ List.map character_mappings

(* sum of game values *)
let solve (s: string): int = parse s
    |> List.map (fun (g: game list) ->
        if List.nth g 0 == GameError then
          0
        else 
          outcome_mapping (List.nth g 1) 
            + hand_value.(game_to_index @@ List.nth g 0).(game_to_index @@ List.nth g 1)
       )
    |> List.fold_left (+) 0

let () =
  let ch = open_in "../input.txt" in
  print_endline(solve @@ really_input_string ch (in_channel_length ch) |> string_of_int)

