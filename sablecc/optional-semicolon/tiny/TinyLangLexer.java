package tiny;

import tiny.lexer.*;
import tiny.node.*;

import java.io.*;

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

// Thanks to Vincent Foley-Bourgon for this implementation!

public class TinyLangLexer extends Lexer
{
	private Token lastToken = null;

	public TinyLangLexer(PushbackReader in)
	{
		super(in);
	}

	private boolean needsSemiColon()
	{
		boolean ret = token instanceof TEol && (
			lastToken instanceof TId ||
			lastToken instanceof TNumber ||
			lastToken instanceof TRPar);

		return ret;
	}

	protected void filter()
	{
		try {
			// Thanks to Matthew Chan and Fan Ma for this fix!
			// You must ignore whitespace at the end of the file (SableCC does NOT
			// do this automatically)
			while (token instanceof TBlank)
			{
				token = getToken();
			}
		}
		catch (Exception e) {
			System.err.println("Error: " + e.getLocalizedMessage());
			System.exit(1);
		}
		if (needsSemiColon())
		{
			System.out.println("<inserted semicolon>");
			token = new TSemicolon();
		}
		lastToken = token;
	}
}
