%%

%{
	Cool coolLanguage = new Cool();
%}

%public
%class AnalisadorLexico
%type int

INT = 0|[1-9][0-9]*
ID = [a-zA-z_][a-zA-Z0-9_]*
STR = \"[^\"]*\"
OPERATOR = [\+\-\/\*]|(<=)|(<-)|(=)|(<)
COMMENT_TYPE1 = --.*\n
COMMENT_TYPE2 = \(\*([^*]|\n)*\*\)
KEY_WORDS = (class)|(else)|(false)|(fi)|(if)|(in)|(inherits)|(isvoid)|(let)|(loop)|(pool)|(then)|(while)|(case)|(esac)|(new)|(of)|(not)|(true)
WHITE_SPACE = [ \t\n]
DEFAULT_TYPES = (String)|(Int)|(IO)|(Object)|(Bool)


%eofval{
  return 0;
%eofval}
%eofclose

%%
{STR}   {coolLanguage.string("{STR}");}
{INT}   {coolLanguage.integer("{INT}");}
{ID}    {coolLanguage.id("{ID}");}
{COMMENT_TYPE1}   {coolLanguage.comment("{COMMENT_TYPE1}");}
{COMMENT_TYPE2}   {coolLanguage.comment("{COMMENT_TYPE2}");}
{KEY_WORDS}   {coolLanguage.key_word("KEY_WORDS");}
{WHITE_SPACE}   {coolLanguage.white_space("WHITE_SPACE");}
{DEFAULT_TYPES}   {coolLanguage.default_types("DEFAULT_TYPES");}

. { throw new RuntimeException("Caractere invalido -> " + yytext()); }