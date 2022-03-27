%%

%{
	Cool coolLanguage = new Cool();
%}

%public
%class AnalisadorLexico
%type int

INT = 0|[1-9][0-9]*
ID = [a-zA-Z_][a-zA-Z0-9_]*
STR = \"([^\"]|\n)*\"?
OPERATOR = [\+\-\/\*:]|(<=)|(<-)|(=)|(<)
COMMENT_TYPE1 = --.*\n
COMMENT_TYPE2 = \(\*([^*]|\n)*\*?\)?
KEY_WORDS = (class)|(else)|(false)|(fi)|(if)|(in)|(inherits)|(isvoid)|(let)|(loop)|(pool)|(then)|(while)|(case)|(esac)|(new)|(of)|(not)|(true)|(init)|(map)
WHITE_SPACE = [ \t\n]
DEFAULT_TYPE = (String)|(Int)|(IO)|(Object)|(Bool)|(SELF_TYPE)
MARKDOWN = [\(\)\{\}\[\]\.;]
UNMACHED_CLOSE_COMMENT = \*\)


%eofval{
  return 0;
%eofval}
%eofclose

%%
{STR}   {coolLanguage.string("STR");}
{INT}   {coolLanguage.integer("INT");}
{COMMENT_TYPE1}   {coolLanguage.comment("COMMENT1");}
{COMMENT_TYPE2}   {coolLanguage.comment("COMMENT2");}
{KEY_WORDS}   {coolLanguage.key_word("KEY_WORDS");}
{WHITE_SPACE}   {coolLanguage.white_space("WHITE_SPACE");}
{DEFAULT_TYPE}   {coolLanguage.default_types("DEFAULT_TYPES");}
{OPERATOR}   {coolLanguage.operator("DEFAULT_TYPE");}
{ID}    {coolLanguage.id("ID");}
{MARKDOWN}    {coolLanguage.markdown(yytext());}
{UNMACHED_CLOSE_COMMENT} {coolLanguage.erro("Unmached *)");}


. { coolLanguage.erro("Caractere invalido -> " + yytext()); }