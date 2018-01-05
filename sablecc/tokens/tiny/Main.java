package tiny;

import tiny.parser.*;
import tiny.lexer.*;
import tiny.node.*;
import java.io.*;

class Main
{
	public static void main(String args[])
	{
		try {
			System.out.println("Enter a \"TinyLang\" expression followed by Ctrl-d:");
			Lexer lexer = new Lexer(new PushbackReader(new InputStreamReader(System.in), 1024));

			while (!(lexer.peek() instanceof EOF))
			{
				Token t = lexer.next();
				if (t instanceof TBlank || t instanceof TEol)
				{
					continue;
				}

				String tokenName = t.getClass().getSimpleName();
				if (t instanceof TNumber || t instanceof TId)
				{
					System.out.println(tokenName + "(" + t.getText() + ")");
				}
				else
				{
					System.out.println(tokenName);
				}
			}
		} 
		catch (Exception e)
		{
			System.out.println("Error: " + e.getLocalizedMessage());
			System.exit(1);
		}
	}
}
