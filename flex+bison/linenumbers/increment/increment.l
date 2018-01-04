%{
#include "y.tab.h"
#include <string.h>
#include <stdlib.h>

extern int lineno;
%}

%option noinput
%option nounput

%%

[ \t\r]+    
\n      { printf("lineno++\n"); lineno++; }

"+"     return '+';
"-"     return '-';
"*"     return '*';
"/"     return '/';
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

.       { fprintf(stderr, "Error: (line %d) unknown character '%s'\n", lineno, yytext); exit(1); }
%%
