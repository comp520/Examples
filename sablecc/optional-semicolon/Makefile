tiny: grammar
	javac tiny/lexer/*.java tiny/parser/*.java tiny/node/*.java tiny/analysis/*.java tiny/*.java
	
grammar: tiny.sablecc
	sablecc tiny.sablecc

clean:	
	rm -fr tiny/*.class tiny/lexer/ tiny/parser/ tiny/node/ tiny/analysis/
