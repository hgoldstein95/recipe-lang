{
open Parser
exception Eof
}

let id = ['A'-'Z' 'a'-'z']*

rule token = parse
    [' ' '\t' '\n'] { token lexbuf }
  | "Recipe"        { RECIPE }
  | "Ingredient"    { INGREDIENT }
  | "Equiptment"    { EQUIPTMENT }
  | "Procedure"     { PROCEDURE }
  | "Finished"      { FINISHED }
  | "mix"           { MIX }
  | "fold"          { FOLD }
  | "add"           { ADD }
  | '.'             { DOT }
  | ':'             { COLEN }
  | id as v         { VAR(v) }
  | eof             { raise Eof }
