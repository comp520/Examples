# Tokens Printing

Given a SableCC lexer, we repeatedly call the `next()` function until we reach the end of file (check using `instanceof EOF`).

Printing tokens is a two step process:
1. Check the token is not one of the ignored tokens (blanks, etc) which are not automatically discarded by SableCC
2. Print the token class using `getClass().getSimpleName()`. If a token has additional data (check the token type), the scanner value can be retrieved using `getText()`
