(* custom character value mappings *)
let custom_code (c: char): int = 
  match c with
    | 'a' .. 'z' -> Char.code c - Char.code 'a' + 1
    | 'A' .. 'Z' -> Char.code c - Char.code 'A' + 27
    | _ -> -1

(* we actually want a character that is in both the first
   and second half of the list
 *)
let solve (backpack: string): int =
  let pack = List.init (String.length backpack) (String.get backpack) in
  let rec aux (lst: char list) (b: char list): char option =
    match lst with
      | [] -> None
      | h :: t ->
          if (List.exists (fun x -> x == h) b) then
            Some h
          else
            aux t (h::b)
      in
  match aux pack [] with
    | None -> -1
    | Some c -> custom_code c

(* this is all correct *)
let () =
  let item_list = ref [] in
  let ch = open_in "../input.txt" in
  try
    while true; do
      item_list := (solve @@ input_line ch) :: !item_list;
    done;
  with End_of_file ->
    close_in ch;
    print_endline (!item_list |> List.fold_left (+) 0 |> string_of_int)
