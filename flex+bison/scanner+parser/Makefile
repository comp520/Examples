CC = gcc

CFLAGS = -Wall

main: parser.tab.o lex.yy.o main.o
	$(CC) lex.yy.o parser.tab.o main.o -o tiny -lfl

parser.tab.c parser.tab.h: tiny.y
	bison --yacc --defines=parser.tab.c --output=parser.tab.h tiny.y

lex.yy.c: tiny.l parser.tab.h
	flex tiny.l
clean:
	rm parser.tab.* lex.yy.*; rm *.o
