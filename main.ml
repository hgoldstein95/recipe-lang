open Ast

let string_of_defn (d : defn) =
  match d with
  | Ingred (v, _) -> v
  | Equip (v, _) -> v

let string_of_recipe (r : recipe) =
  r.title ^ (r.defns
             |> List.map string_of_defn
             |> List.fold_left (fun s x -> s ^ " " ^ x) "")

let () =
  let _ =
    if Array.length Sys.argv <> 2 then
      (Printf.printf "Usage: main <file>\n";
       exit 0) in
  let filename = Sys.argv.(1) in
  let lexbuf = Lexing.from_channel (open_in filename) in
  let result = Parser.main Lexer.token lexbuf in
  print_endline (string_of_recipe result)
