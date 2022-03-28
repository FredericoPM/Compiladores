%%
/*
A classe Cool.java foi criada para administrar a pilha de tokens.
Além de tratar erros da análise léxica.
*/
%{
	Cool coolLanguage = new Cool();
%}
/*

*/
%public
%class AnalisadorLexico
%type int
/*
Abaixo foram definidos nossos TOKENS com suas respectivas expressões regulares.
*/
INT = 0|[1-9][0-9]*
ID = [a-zA-Z_][a-zA-Z0-9_]*
STR = \"([^\"]|\n)*\"?
OPERATOR = [\+\-\/\*:]|(<=)|(<-)|(=)|(<)
COMMENT_TYPE1 = --.*\n
COMMENT_TYPE2 = \(\*([^*]|\n)*\*?\)?
KEY_WORDS = (class)|(else)|(false)|(fi)|(if)|(in)|(inherits)|(isvoid)|(let)|(loop)|(pool)|(then)|(while)|(case)|(esac)|(new)|(of)|(not)|(true)|(init)|(map)
WHITE_SPACE = [ \t\n]
MARKDOWN = [\(\)\{\}\[\]\.;]
UNMACHED_CLOSE_COMMENT = \*\)


%eofval{
  return 0;
%eofval}
%eofclose

%%
/*
  Na seção abaixo são definidos os procedimentos, do objeto coolLanguage(classe Cool.java),
que precisam ser executados quando cada TOKEN é encontrado.

*/
{STR}   {coolLanguage.string("STR");}
{INT}   {coolLanguage.integer("INT");}
{COMMENT_TYPE1}   {coolLanguage.comment("COMMENT1");}
{COMMENT_TYPE2}   {coolLanguage.comment("COMMENT2");}
{KEY_WORDS}   {coolLanguage.key_word("KEY_WORDS");}
{WHITE_SPACE}   {coolLanguage.white_space("WHITE_SPACE");}
{OPERATOR}   {coolLanguage.operator("DEFAULT_TYPE");}
{ID}    {coolLanguage.id("ID");}
{MARKDOWN}    {coolLanguage.markdown(yytext());}
{UNMACHED_CLOSE_COMMENT} {coolLanguage.erro("Unmached *)");}


. { coolLanguage.erro("Caractere invalido -> " + yytext()); }