%option noyywrap

%%
"+" {
    printf("PLUS\n");
}
"-" {
    printf("MINUS\n");
}
"*" {
    printf("TIMES\n");
}
"/" {
    printf("DIVIDE\n");
}
[0-9]+ {
    printf("NUMBER: %s\n", yytext);
}
\n {
    printf("NEWLINE\n");
}
[ ] {
    printf("SPACE\n");
}
\t {
    printf("TAB\n");
}
. {
    printf("UNKNOWN CHAR: %s\n", yytext);
}
%%

int main() {
    yylex();

    return 1;
}