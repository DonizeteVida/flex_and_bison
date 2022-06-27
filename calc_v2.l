%{
enum Token {
    PLUS = 1,
    MINUS = 2,
    TIMES = 3,
    DIVIDE = 4,
    NUMBER = 5,
    NEWLINE = 6,
    SPACE = 7,
    TAB = 8,
    UNKNOWN = 9
};
char* TokenName[] = {
    "PLUS",
    "MINUS",
    "TIMES",
    "DIVIDE",
    "NUMBER",
    "NEWLINE",
    "SPACE",
    "TAB",
    "UNKNOWN",
};
int yyvalue;
%}

%%
"+" {
    return PLUS;
}
"-" {
    return MINUS;
}
"*" {
    return TIMES;
}
"/" {
    return DIVIDE;
}
[0-9]+ {
    yyvalue = atoi(yytext);
    return NUMBER;
}
\n {
    return NEWLINE;
}
[ ] {
    return SPACE;
}
\t {
    return TAB;
}
. {
    return UNKNOWN;
}
%%

int yywrap() {
    return 1;
}

int main() {
    int token;
    while (token = yylex()) {
        printf("token: %s", TokenName[token - 1]);
        if (token == NUMBER) {
            printf(" = %d\n", yyvalue);
        } else {
            printf("\n");
        }
    }

    return 1;
}