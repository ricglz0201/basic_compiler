%{
#include "syntax_analyser.tab.h"
%}

NUMBER -?[0-9]+
STRING [\"\“][0-9a-z(\ )]*[\"\”]
SYMBOL [a-z]*
BOOLEAN \#[ft]

%%

{NUMBER} { printf("NUM : %s\n", yytext); return(NUM); };
{STRING} { printf("STR : %s\n", yytext); return(STR); };
{SYMBOL} { printf("SYM : %s\n", yytext); return(SYM); };
{BOOLEAN} { printf("BOOL : %s\n", yytext); return(BOOL); };
\$ { printf("END : %s\n", yytext); return(END); };

\(  { printf("LCP : %s\n", yytext); return (LCP); };
\)  { printf("RCP : %s\n", yytext); return (RCP); };
\[  { printf("LSP : %s\n", yytext); return (LSP); };
\]  { printf("RSP : %s\n", yytext); return (RSP); };

(\ )+ ;
[\n]  ;
. { printf("<<ERROR LEXICO>>\n");return 1; };
<<EOF>> {return 0;};
