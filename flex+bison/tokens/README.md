# Tokens Printing

To print tokens (and not execute the parser), you will be required to execute the scanner only.

If flex is used in isolation (there is no grammar or bison file), a single call to `yylex()` will scan the entire file, executing the actions for each token scanned. Printing tokens is as simple as adding a `printf` call to each scanner action.

1. In your main file, call `yylex()` in a loop until it returns `0`
```
g_tokens = 1;
while (yylex()) {}
```

2. Add `printf` to each action if the global variable is set.
```
if { if (g_tokens) printf("tIF\n"); return tIF; }
```
