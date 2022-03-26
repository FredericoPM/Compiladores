import java.io.IOException;
import java.io.StringReader;

public class Tester {

	public static void main(String[] args) throws IOException{
		
		String expr = "[ teste ]";
		
		AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(expr));
		lexical.yylex();

	}

}