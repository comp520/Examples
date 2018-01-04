#include <stdio.h>
#include "tree.h"
#include "pretty.h"

EXP *expression;

int yyparse();

int main() {
	if (!yyparse()) {
		prettyEXP(expression);
		printf("\n");
	}
	return 0;
}
