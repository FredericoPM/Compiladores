import java_cup.runtime.Symbol;

%%


%{
    // Max size of string constants
    static int MAX_STR_CONST = 1025;

    // For assembling string constants
    StringBuffer string_buf = new StringBuffer();

    private int curr_lineno = 1;
    int get_curr_lineno() {
	    return curr_lineno;
    }

    private AbstractSymbol filename;

    void set_filename(String fname) {
	    filename = AbstractTable.stringtable.addString(fname);
    }

    AbstractSymbol curr_filename() {
	    return filename;
    }
%}

%init{
    // empty for now
%init}


%eofval{
    switch(yy_lexical_state) {
      case YYINITIAL:
	    break;
    }
    return new Symbol(TokenConstants.EOF);
%eofval}


%class CoolLexer
%cup


DARROW = "=>"


%%

<YYINITIAL>{DARROW}		{ return new Symbol(TokenConstants.DARROW); }

.                               { /* This rule should be the very last
                                     in your lexical specification and
                                     will match match everything not
                                     matched by other lexical rules. */
                                  System.err.println("LEXER BUG - UNMATCHED: " + yytext()); }
