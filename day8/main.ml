open Base
open Stdio

(* yeah idk why this not in stdlib *)
let sum = List.fold_left ~init:0 ~f:(+)

(* each cell is parsed as a tree *)
type tree = {
  height: int;
  mutable visible: bool;
}

let parse =
  let parseCell c = { height = Int.of_string @@ String.of_char c; visible = false } in
  let parseLine l = List.map ~f:parseCell (String.to_list l) in
  List.map ~f:parseLine

let p1 l =
  let trees = parse l in

let () =
  let content = In_channel.read_all "input.txt" in
  let lines = String.split_lines content in
  printf "%d\n" @@ p1 lines
