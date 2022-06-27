%option noyywrap

%{
    #include "bison_calc.h"
%}

%%
"+" {
    return ADD;
}
"-" {
    return SUB;
}
"*" {
    return MUL;
}
"/" {
    return DIV;
}
"|" {
    return ABS;
}
\n {
    return EOL;
}
[0-9]+ {
    yylval = atoi(yytext);
    return NUMBER;
}
[ \t] {  }
. {
    printf("Unknown char: %s", yytext);
}
%%