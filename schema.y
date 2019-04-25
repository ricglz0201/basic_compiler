%{
// [A01282829] Ricardo Javier Gonzalez Castillo
#include <stdio.h>
#if YYBISON
union YYSTYPE;
int yylex();
int yyerror(char*);
#endif
%}

// Define tokens that will be returned by lex
%token NUM STR SYM BOOL END LCP RCP LSP RSP

%%

start: prog ;
prog:
  exp prog { printf("[PRG]\n"); }
  | end  { printf("[PRG]\n"); } ;
end: END { return 0; } ;
exp:
  atomo { printf("[EXP]\n"); }
  | lista { printf("[EXP]\n"); } ;
atomo:
  SYM { printf("[ATM]\n"); }
  | const { printf("[ATM]\n"); } ;
const:
  NUM { printf("[CON]\n"); }
  | BOOL { printf("[CON]\n"); }
  | STR { printf("[CON]\n"); } ;
lista:
  LCP elem RCP { printf("[LST]\n"); }
  | LSP elem RSP { printf("[LST]\n"); } ;
elem:
  exp elem { printf("[ELM]\n"); }
  |  { printf("[ELM]\n"); } ;
%%

// Overload yyerror function so it can print if an error was found
int yyerror(char *s) {
  printf("<<ERROR SINTACTICO>>\n");
  return 1;
}

int main() {
  if(!yyparse()) printf("<<PROGRAMA CORRECTO>>\n");
}
