%{
#include <stdio.h>
#include <stdlib.h>
#include "tree.h"

extern int lineno;
extern EXP *expression;

int yylex();
void yyerror(const char *s) { fprintf(stderr, "Error: (line %d) %s\n", lineno, s); exit(1); }
%}

%code requires
{
	#include "tree.h"
}

%union {
	int intval;
	char *identifier;
	EXP *exp;
}

%token <intval> tINTVAL
%token <identifier> tIDENTIFIER 

%type <exp> program exp

%start program

%left '+' '-'
%left '*' '/'

%error-verbose

%% 

program: exp { expression = $1; }
;

exp : tIDENTIFIER { $$ = makeEXPid($1, lineno); }
    | tINTVAL     { $$ = makeEXPintconst($1, lineno); }
    | exp '*' exp { $$ = makeEXPtimes($1, $3, lineno); }
    | exp '/' exp { $$ = makeEXPdiv($1, $3, lineno); }
    | exp '+' exp { $$ = makeEXPplus($1, $3, lineno); }
    | exp '-' exp { $$ = makeEXPminus($1, $3, lineno); }
    | '(' exp ')' { $$ = $2; } 
;

%%
