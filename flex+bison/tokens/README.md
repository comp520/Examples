# Tokens Printing

If flex is used in isolation, a single call to `yylex()` will scan the entire file, executing the actions for each token scanned. Printing tokens is as simple as adding a `printf` call to each action.

If flex is used in combination with bison, you must call `yylex()` in a loop until it returns `0`. Add `printf` to each action.
