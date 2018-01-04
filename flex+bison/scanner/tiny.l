/* The first section of a flex file contains:
 *    1. A code section for includes and other arbitrary C code. Copied to the scanner verbatim
 *    2. Helper definitions for regexes
 *    3. Scanner options
 */

/* Code section */
%{
#include <stdio.h>
%}

/* Helper definitions */
DIGIT [0-9]

/* Scanner options, line number generation */
%option yylineno

/* The second section of a flex file contains the regular expressions, using helper definitions
 * where appropriate ({<helper name>}). Sections in flex are divided by %%.
 *
 * Each line contains the regex, followed by the scanner action. Actions are executed when
 * a token is matched. A missing action is treated as a NOP.
 */

/* Note the use of 3 keywords:
 *    - yyleng: Length of the scanned token
 *    - yytext: Matched text
 *    - yylineno: Convenience variable for the line number provided by %option yylineno
 */
%%
[\r\n]+
[ \t]+      printf("Whitespace, length %lu\n", yyleng);

"+"         printf("Plus\n");
"-"         printf("Minus\n");
"*"         printf("Times\n");
"/"         printf("Divide\n");
"("         printf("Left parenthesis\n");
")"         printf("Right parenthesis\n");

0|([1-9]{DIGIT}*) {
	    printf ("Integer constant: %s\n", yytext);
}
[a-zA-Z_][a-zA-Z0-9_]* {
	    printf ("Identifier: %s\n", yytext);
}

. 	    { fprintf (stderr, "Error: (line %d) unexpected character '%s'\n", yylineno, yytext); exit(1); }
%%

// The final section of a flex file contains the user code
int main()
{
	// Invoke the scanner using yylex(). Since there is no parser, this will execute unti
	// the end of file
	yylex();
	return 0;
}
