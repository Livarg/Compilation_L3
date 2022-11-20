%{

  open Lexing
  open Mml

%}

%token NEG NOT
%token PLUS STAR MIN MOD
%token <int> CST
%token BOOL INT UNIT MUTABLE
%token <bool> FALSE <bool> TRUE
%token <string> IDENT
%token FUN LET REC IN
%token IF THEN ELSE 
%token TYPE
%token EOF

%left PLUS
%left STAR
%left MIN

%start program
%type <Mml.prog> program

%%

program:
| (* à compléter *) code=expression EOF { {types=[]; code} }
;

type:
;

simple_expression:
| n = CST { Int(n) }
| b = TRUE { Bool(b) }
| b = FALSE { Bool(b) }
| u = UNIT { () }
| s = IDENT { String(s) }
;

expression:
| e=simple_expression { e }
| e1=expression op=binop e2=expression { Bop(op, e1, e2) }
| e1 = expression op=unop { Uop(op, e1)}
| IF e1 = expression THEN e2 = expression {}
| IF e1 = expression THEN e2 = expression ELSE e3 = expression {}
;

%inline unop:
| NEG { neg }
| NOT { Not }

%inline binop:
| PLUS { Add }
| STAR { Mul }
| MINUS { Min }
| DIVIDE { Div }
| MODULO { Mod }
| EQUALITY { Eg }
| DIFFERENCE { Dif }
| INFERIEUR { Inf }
| INFERIEUR_EGALE { Inf_Eg }
| AND { And }
| OR { Or }
;

