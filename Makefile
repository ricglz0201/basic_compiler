CC=gcc -c
CO=gcc -o
all: output.o

output.o: schema.tab.o lex.yy.o
	${CO} output.o schema.tab.o lex.yy.o -ll

schema.tab.o: schema.tab.c
	${CC} schema.tab.c

schema.tab.c: schema.y
	bison -d schema.y

lex.yy.o: lex.yy.c
	${CC} lex.yy.c

lex.yy.c: schema.l
	flex schema.l
