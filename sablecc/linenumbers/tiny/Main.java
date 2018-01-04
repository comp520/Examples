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
			Parser p = new Parser(new Lexer(new PushbackReader(new InputStreamReader(System.in), 1024)));

			Start node = p.parse();

			LineNumbers lineNumbers = new LineNumbers();
			node.apply(lineNumbers);
			
			PrettyPrinter pp = new PrettyPrinter(lineNumbers);
			node.apply(pp);

			System.out.println();
		} 
		catch (Exception e)
		{
			System.out.println("Error: " + e.getLocalizedMessage());
			System.exit(1);
		}
	}
}
