%{
    #include<stdio.h>
%}

digit [0-9]
alpha [a-z|A-z]
digits {digit}+
optional_fraction ("."{digits})?
optional_exponent (E[+-]?{digits})?

%%

"create"        printf(" detected \"create\"\n");
"database"      printf(" detected \"database\"\n");
"use"           printf(" detected \"use\"\n");
"table"         printf(" detected \"table\"\n");
"tables"        printf(" detected \"tables\"\n");
"show"          printf(" detected \"show\"\n");
"insert"        printf(" detected \"insert\"\n");
"select"        printf(" detected \"select\"\n");
"update"        printf(" detected \"update\"\n");
"delete"        printf(" detected \"delete\"\n");
"drop"          printf(" detected \"drop\"\n");
"exit"          printf(" detected \"exit\"\n");
.               printf(" unkown\n");
{digits}{optional_fraction}{optional_exponent} printf("detected num %s\n", yytext );

%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}