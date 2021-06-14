%{
    #include<stdio.h>
    #include<string.h>
%}

digit [0-9]
alpha [a-zA-Z]
digits {digit}+
optional_fraction ("."{digits})?
optional_exponent (E[+-]?{digits})?

%%

"create"                                        printf("detected keyword \"create\"\n");
"table"                                         printf("detected keyword \"table\"\n");
"database"                                      printf("detected keyword \"database\"\n");
"use"                                           printf("detected keyword \"use\"\n");
"select"                                        printf("detected keyword \"select\"\n");
"insert"                                        printf("detected keyword \"insert\"\n");
"delete"                                        printf("detected keyword \"delete\"\n");
"update"                                        printf("detected keyword \"update\"\n");
"from"                                          printf("detected keyword \"from\"\n");
"where"                                         printf("detected keyword \"where\"\n");
"into"                                          printf("detected keyword \"into\"\n");
"values"                                        printf("detected keyword \"values\"\n");
"set"                                           printf("detected keyword \"set\"\n");
"int"                                           printf("detected keyword \"int\"\n");
"double"                                        printf("detected keyword \"double\"\n");
"char"                                          printf("detected keyword \"char\"\n");
"and"                                           printf("detected keyword \"and\"\n");
"or"                                            printf("detected keyword \"or\"\n");


({alpha}|"_")({digit}|{alpha}|"_")*             printf("detected var \"%s\"\n", yytext );
{digits}                                        printf("detected int \"%d\"\n", atoi(yytext) );
{digits}{optional_fraction}{optional_exponent}  printf("detected double \"%s\"\n", yytext );
\"(.)*\"                                        printf("detected string \"%s\"\n", yytext );
.                                               printf("detected \"%s\"\n", yytext );
%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}