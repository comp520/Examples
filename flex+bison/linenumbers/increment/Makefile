CC = gcc

CFLAGS = -Wall

main: y.tab.o lex.yy.o main.o pretty.h pretty.o tree.h tree.o
	$(CC) lex.yy.o y.tab.o pretty.o tree.o main.o -o tiny -lfl

y.tab.c y.tab.h: increment.y
	bison --yacc --defines increment.y

lex.yy.c: increment.l y.tab.h
	flex increment.l

clean:
	rm y.tab.* lex.yy.*; rm *.o; rm tiny
