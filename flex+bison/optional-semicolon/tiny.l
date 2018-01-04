%{
#include "parser.tab.h"
#include <string.h>
#include <stdlib.h>

#define YY_USER_ACTION yylloc.first_line = yylloc.last_line = yylineno;

// Implementing optional semicolons has two choices. Either (a) have grammar rules
// which can handle optional syntax; or (b) insert semicolons where appropriate
// In this example we choose the latter.

// Optional semicolons are inserted at the end of a line if there is one not already
// present. Therefore we must keep track of the previous symbol returned to the parser.
// When we encounter a newline, if the previous token induces a semicolon (if it is the
// end of an expression) we insert the semicolon)

// Note that this means we cannot end a line on an identifier/value/rightparen or this
// will signal the end of an expression. In the Go programming language there is a more
// complete set of tokens, but it has the same issue!

// Thanks to Vincent Foley-Bourgon for his help!

int lastToken = -1;
#define RETURN(token) lastToken = token; return token;
int needsSemiColon()
{
	return lastToken == tIDENTIFIER ||
	lastToken == tINTVAL ||
	lastToken == ')';
}
%}

DIGIT [0-9]

%option yylineno

%option noinput
%option nounput

%%
[ \t\r]+
\n      { if (needsSemiColon()) { printf("<inserted semicolon>\n"); RETURN(';'); } }

"+"     RETURN('+');
"-"     RETURN('-');
"*"     RETURN('*');
"/"     RETURN('/');
"("     RETURN('(');
")"     RETURN(')');

";"     RETURN(';');

0|([1-9]{DIGIT}*) {
	yylval.intval = atoi(yytext);
	RETURN(tINTVAL);
}
[a-zA-Z_][a-zA-Z0-9_]* {
	yylval.identifier = strdup(yytext);
	RETURN(tIDENTIFIER);
}

. 	{ fprintf (stderr, "Error: (line %d) unexpected character '%s'\n", yylineno, yytext); exit(1); }
%%
