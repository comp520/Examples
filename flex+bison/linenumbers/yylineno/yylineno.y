%{
#include <stdio.h>
#include <stdlib.h>
#include "tree.h"

extern int yylineno;
extern EXP *expression;

int yylex();
void yyerror(const char *s) { fprintf(stderr, "Error: (line %d) %s\n", yylineno, s); exit(1); }
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
%locations

%% 

program: exp { expression = $1; }
;

exp : tIDENTIFIER { $$ = makeEXPid($1, @1.first_line); }
    | tINTVAL     { $$ = makeEXPintconst($1, @1.first_line); }
    | exp '*' exp { $$ = makeEXPtimes($1, $3, @2.first_line); }
    | exp '/' exp { $$ = makeEXPdiv($1, $3, @2.first_line); }
    | exp '+' exp { $$ = makeEXPplus($1, $3, @2.first_line); }
    | exp '-' exp { $$ = makeEXPminus($1, $3, @2.first_line); }
    | '(' exp ')' { $$ = $2; } 
;

%%
