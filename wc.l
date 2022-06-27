%{
    int chars = 0;
    int words = 0;
    int lines = 0;
%}

%%

[a-zA-Z]+ {
    words++;
    chars += strlen(yytext);
}
\n {
    chars++;
    lines++;
}
. {
    chars++;
}

%%

int yywrap() { return 1; }

int main() {
    yylex();

    printf("\n");

    printf("chars %d\n", chars);
    printf("words %d\n", words);
    printf("lines %d\n", lines);
    
    return 1;
}