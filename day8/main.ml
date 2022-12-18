open Base
open Stdio

(* yeah idk why this not in stdlib *)
let sum = List.fold_left ~init:0 ~f:(+)

(* each cell is parsed as a tree *)
type tree = {
  height: int;
  mutable visible: bool;
}

(* TODO *)
let p1 (l: string list): int =
  List.length l + 2

let () =
  let content = In_channel.read_all "input.txt" in
  let lines = String.split_lines content in
  printf "%d\n" @@ p1 lines
