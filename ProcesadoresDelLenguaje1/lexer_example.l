%{
#include <string.h>
%}

%option noyywrap reentrant stack nounput
%x MODE_A MODE_B

%{
enum {
    TOK_1 = 10,
    TOK_2 = 20,
    TOK_3 = 30,
};
%}

%%

. printf("INITIAL: %s\n", yytext); yy_push_state(MODE_A, yyscanner); return TOK_1;
<MODE_A>. printf("MODE_A: %s\n", yytext); BEGIN(MODE_B); return TOK_2;
<MODE_B>. printf("MODE_B: %s\n", yytext); yy_pop_state(yyscanner); return TOK_3;
<MODE_A>. { printf("MODE_A: %s\n", yytext); yy_push_state(MODE_B, yyscanner); return TOK_2; }
%%

int main(void) {
    yyscan_t scanner;
    yylex_init(&scanner);
    while (yylex(scanner) != 0) {
    }
    yylex_destroy(scanner);
    return 0;
}

%%

int main()
{
    const char buf[] = "123456789";
    int len = strlen(buf);

    yyscan_t scanner;
    yylex_init(&scanner);
    YY_BUFFER_STATE bs = yy_scan_bytes(buf, len, scanner);
    int token_id;
    while ((token_id = yylex(scanner))) {
        printf("TOKEN: %d\n", token_id);
    }
    yy_delete_buffer(bs, scanner);
    yylex_destroy(scanner);

    return 1;
}
