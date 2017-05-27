%{
open Ast
%}

%token RECIPE INGREDIENT EQUIPTMENT PROCEDURE FINISHED MIX FOLD ADD DOT COLEN
%token <string> VAR
%token <string> LIT

%start main
%type <Ast.recipe> main
%%

main : RECIPE LIT DOT defns proc { { title = $2; defns = $4; steps = $5; } }

defns : defn       { [$1] }
      | defns defn { $2 :: $1 }

defn : INGREDIENT VAR DOT { Ingred ($2, "") }
     | EQUIPTMENT VAR DOT { Equip ($2, "") }

proc : PROCEDURE DOT steps FINISHED DOT { $3 }

steps : step       { [$1] }
      | steps step { $2 :: $1 }

step : com DOT { ($1, "") }

com : MIX     { Mix }
    | FOLD    { Fold }
    | ADD VAR { Add $2 }
