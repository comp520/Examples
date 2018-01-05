# Line Numbers
In SableCC, line numbers are stored by default in terminals (tokens). Non-terminals (variables) do not have such functionality.

We therefore must provide our own functionality for line numbers using information gathered from the tokens. Our implementation extends the `ReversedDepthFirstAdapter` and propagates line information from the leaves to the root of the parse tree. For each node:
1. If the node is a non-terminal:
  a. Traverse all children
  b. Update the parent with its line number (its line number has been set during traversal of the children)
2. If the none is a terminal, set the parent node's line number to the tokens line number. Using a `ReversedDepthFirstAdapter` traverses a nodes children backwards, meaning the value stored for the parent node is its **first** child as required
