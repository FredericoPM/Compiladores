%%

%{
	Cool coolLanguage = new Cool();
%}

%public
%class AnalisadorLexico
%type int

INT = 0|[1-9][0-9]*

%eofval{
  return 0;
%eofval}
%eofclose

%%

{INT}		{coolLanguage.push(yytext());}
"+"			{coolLanguage.push(yytext());}
"s"	    {coolLanguage.push(yytext());}
"e"			{coolLanguage.doAction();}
"d"			{coolLanguage.printStack();}
"x"			{return 0;}

. { throw new RuntimeException("Caractere invalido" + yytext()); }