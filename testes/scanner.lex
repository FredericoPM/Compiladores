%%

%{
	Cool coolLanguage = new Cool();
%}

%public
%class AnalisadorLexico
%type int

INT = 0|[1-9][0-9]*
FLOAT = {INT}\.[0-9]*
ID = [a-zA-z_][a-zA-Z0-9_]*
STR = \".*\"
OPERATOR = [\+\-\/\*]|(<=)|(<-)|(=)|(<)
COMMENT_TYPE1 = --.*\n
COMMENT_TYPE2 = \(\*([^*]|\n)*\*\)
KEY_WORDS = (class)|(else)|(false)|(fi)|(if)|(in)|(inherits)|(isvoid)|(let)|(loop)|(pool)|(then)|(while)|(case)|(esac)|(new)|(of)|(not)|(true)
WHITE_SPACE = [\s\n]
DEFAULT_TYPES = (String)|(Int)|(IO)|(Object)|(Bool)
//----------------------------------------------------
CLASS = class\s{ID}(\sinherits\s{ID}\s)?\{FEATURE\}
FEATURE = {ID}\({FORMAL}*\):{ID}\{{EXPR}\}
FORMAL = {ID}\s:\s{ID}
EXPR = {ID}|{INT}|{FLOAT}|{STR}|{EXPR}\s{OPERATOR}\s{ID}|{INT}|{FLOAT}|{STR}|{EXPR}

%eofval{
  return 0;
%eofval}
%eofclose

%%
{STR}   {coolLanguage.string("STR");}
{INT}   {coolLanguage.integer("INT");}
{FLOAT}   {coolLanguage.float("FLOAT");}
{COMMENT_TYPE1}   {coolLanguage.comment("COMMENT_TYPE1");}
{COMMENT_TYPE2}   {coolLanguage.comment("COMMENT_TYPE2");}
{KEY_WORDS}   {coolLanguage.key_word("KEY_WORDS");}
{WHITE_SPACE}   {coolLanguage.white_space("WHITE_SPACE");}
{DEFAULT_TYPES}   {coolLanguage.default_types("DEFAULT_TYPES");}
{CLASS} {coolLanguage.class("CLASS");}
{FORMAL} {coolLanguage.formal("FORMAL");}
{EXPR} {coolLanguage.expr("EXPR");}


. { throw new RuntimeException("Caractere invalido -> " + yytext()); }