%%

%{
	Cool coolLanguage = new Cool();
%}

%public
%class AnalisadorLexico
%type int

INT = 0|[1-9][0-9]*
FLOAT = 0|[1-9][0-9]*\.0|[1-9][0-9]*
ID = [a-zA-z_][a-zA-Z0-9_]*
STR = \".*\"
OPERATOR = [\+\-\/\*=<(<=)]
COMMENT_TYPE1 = --.*\n
COMMENT_TYPE2 = \(\*([^*]|\n)*\*\)
KEY_WORDS = (class)|(else)|(false)|(fi)|(if)|(in)|(inherits)|(isvoid)|(let)|(loop)|(pool)|(then)|(while)|(case)|(esac)|(new)|(of)|(not)|(true)
WHITE_SPACE = [\s\n]
DEFAULT_TYPES = (String)|(Int)|(IO)|(Object)|(Bool)
CLASS = class\s[a-zA-z_][a-zA-Z0-9_]*(\sinherits\s[a-zA-z_][a-zA-Z0-9_]*\s)?\{FEATURE\}
FEATURE = ID\(FORMAL{1,*}\):ID\{EXPR\}
FORMAL = [a-zA-z_][a-zA-Z0-9_]*\s:\s[a-zA-z_][a-zA-Z0-9_]*
EXPR = id|int|float|str|EXPR\soperador\sid|int|float|str|EXPR


%eofval{
  return 0;
%eofval}
%eofclose

%%
{STR}   {coolLanguage.string("STR");}
{INT}   {coolLanguage.integer("INT");}
{FLOAT}   {coolLanguage.integer("FLOAT");}
{STR}   {coolLanguage.integer("STR");}
{COMMENT_TYPE1}   {coolLanguage.integer("COMMENT_TYPE1");}
{COMMENT_TYPE2}   {coolLanguage.integer("COMMENT_TYPE2");}
{KEY_WORDS}   {coolLanguage.integer("KEY_WORDS");}
{WHITE_SPACE}   {coolLanguage.integer("WHITE_SPACE");}
{DEFAULT_TYPES}   {coolLanguage.integer("DEFAULT_TYPES");}
{CLASS} {coolLanguage.integer("CLASS");}
{FORMAL} {coolLanguage.integer("FORMAL");}
{EXPR} {coolLanguage.integer("EXPR");}


. { throw new RuntimeException("Caractere invalido -> " + yytext()); }