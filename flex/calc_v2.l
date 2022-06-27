%option noyywrap

%{
enum yytokenval {
    NUMBER = 258,
    ADD,
    SUB,
    MUL,
    DIV,
    ABS,
    EOL
};
int yylval;
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
[0-9]+ {
    yylval = atoi(yytext);
    return NUMBER;
}
[ \t] {  }
. {
    printf("Unknown char: %s", yytext);
}
%%

int main() {
    int token;
    while (token = yylex()) {
        printf("token: %d", token);
        if (token == NUMBER) {
            printf(" = %d", yylval);
        }
        printf("\n");
    }

    return 1;
}