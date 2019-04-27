%{
// [A01282829] Ricardo Javier Gonzalez Castillo
#include <stdio.h>
#include <stdbool.h>
#if YYBISON
union YYSTYPE;
int yylex();
int yyerror(char*);
#endif
%}

%{
bool last = false;
%}

// Define tokens that will be returned by lex
%token NUM STR SYM BOOL END LCP RCP LSP RSP


%%
prog: exp prog {
        printf("[PRG]\n%s", last ? "<<PROGRAMA CORRECTO>>\n" : "");
        last = false;
      }
      | END  { printf("[PRG]\n"); last = true; } ;
exp:
  atomo { printf("[EXP]\n"); }
  | lista { printf("[EXP]\n"); } ;
atomo:
  SYM { printf("[ATM]\n"); }
  | const { printf("[ATM]\n"); } ;
const:
  NUM { printf("[CNT]\n"); }
  | BOOL { printf("[CNT]\n"); }
  | STR { printf("[CNT]\n"); } ;
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
  yyparse();
}