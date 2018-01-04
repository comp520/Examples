#include <stdio.h>
#include "tree.h"
#include "pretty.h"

EXP *expression;

int lineno;
int yyparse();

int main() {
	lineno = 1;
	if (!yyparse()) {
		prettyEXP(expression);
		printf("\n");
	}
	return 0;
}
