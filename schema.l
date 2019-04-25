%{
// [A01282829] Ricardo Javier Gonzalez Castillo
#include "schema.tab.h"
%}

%{
//
// Identify the different tokens
// Number can be a positive or a negative or a zero of any amount of digits
// A string will be one sequence of caracter that starts with " and ends with "
//   or the unicode equivalents
// A symbol will be a sequence of lowercase characters
// A boolean wil be a sequence of 2 characters that starts with # and ends with
//   t or f
//
%}
NUMBER -?[0-9]+
STRING [\"\“][0-9a-zA-Z(\ )]*[\"\”]
SYMBOL [a-z]*
BOOLEAN \#[ft]

%{
//
// Will find the tokens and print that they found the tokens. And return that
// token
//
%}
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
%{
// If nothing was found gaves error
%}
. { printf("<<ERROR LEXICO>>\n");return 1; };

<<EOF>> {return 0;};
