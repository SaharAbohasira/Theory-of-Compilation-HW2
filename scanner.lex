%{
/* Declarations section */
#include <stdio.h>
#include "tokens.hpp"
%}

%option yylineno
%option noyywrap

%%
int                                                 return INT;
byte                                                return BYTE;
b                                                   return B;
bool                                                return BOOL;
and                                                 return AND;
or                                                  return OR;
not                                                 return NOT;
true                                                return TRUE;
false                                               return FALSE;
return                                              return RETURN;
if                                                  return IF;
else                                                return ELSE;
while                                               return WHILE;
break                                               return BREAK;
continue                                            return CONTINUE;
;                                                   return SC;
\(                                                  return LPAREN;
\)                                                  return RPAREN;
\{                                                  return LBRACE;
\}                                                  return RBRACE;
=                                                   return ASSIGN;
==|!=                                               return EQUALITY;
>|<|<=|>=                                           return RELATIONAL;
\+|\-                                               return ADD_SUB;
\*|\\                                               return MULT_DIV;
[a-zA-Z][a-zA-Z0-9]*                                return ID;
0|[1-9][0-9]*                                       return NUM;
\"([^\n\r"\\]\\[rnt"\\])+\"                         return STRING;
.                                                   {output::errorLex(yylineno); exit(0);}
