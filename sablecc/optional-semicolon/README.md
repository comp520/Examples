# Optional Semicolons

Implementing optional semicolons has two choices:
1. have grammar rules which can handle optional syntax
2. insert semicolons where appropriate

In this example we choose the latter. Semicolons are inserted when the scanner encounters a newline if there is one not already present. We must therefore keep track of the previous token returned to the parser, and handle the next token as appropriate. Note that this means we cannot end a line on an identifier/value/rightparen or this will signal the end of an expression. In the Go programming language there is a more complete set of tokens, but it has the same issue!

Thanks to Vincent Foley-Bourgon for this implementation!
Thanks to Matthew Chan and Fan Ma for their fix with ignored tokens!
