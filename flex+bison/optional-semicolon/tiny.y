%{
#include <stdio.h>
#include <stdlib.h>

extern int yylineno;
int yylex();

void yyerror(const char *s) { fprintf(stderr, "Error: (line %d) %s\n", yylineno, s); exit(1); }
%}

%union {
	int intval;
	char *identifier;
}

%token <intval> tINTVAL
%token <identifier> tIDENTIFIER 

%left '+' '-'
%left '*' '/'

%start program

%locations
%error-verbose

%% 
program: exp ';'
       ;

exp : tIDENTIFIER
    | tINTVAL
    | exp '*' exp
    | exp '/' exp
    | exp '+' exp
    | exp '-' exp
    | '(' exp ')'
    ;

%%
