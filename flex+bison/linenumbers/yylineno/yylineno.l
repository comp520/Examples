%{
#include "y.tab.h"
#include <string.h>
#include <stdlib.h>

#define YY_USER_ACTION yylloc.first_line = yylloc.last_line = yylineno;
%}

%option noinput
%option nounput
%option yylineno

%%

[ \t\r\n]+

"*"     return '*';
"/"     return '/';
"+"     return '+';
"-"     return '-';
"("     return '(';
")"     return ')';

0|([1-9][0-9]*) {
	yylval.intval = atoi(yytext);
	return tINTVAL;
}

[a-zA-Z_][a-zA-Z0-9_]* { 
	yylval.identifier = strdup(yytext);
	return tIDENTIFIER; 
}

.       { fprintf(stderr, "Error: (line %d) unexpected character '%s'\n", yylineno, yytext); exit(1); }
%%
