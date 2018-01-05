# Line Numbers

In flex+bison, there are 2 main ways to implement line numbers:
1. `increment`: a manual approach increments a counter on each newline and the AST is built by referencing the global variable
2. `yylineno`: builtin functionality of flex+bison (%option yylineno and %locations respectively) provide more accurate position information on a token-by-token basis
