import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.nio.file.Files;


public class Tester {

	public static void main(String[] args) throws IOException{

		File file = new File("testes/test.cl.skel");
		String string_arquivo = new String(Files.readAllBytes(file.toPath()));


		/* 		
		String expr = "[ teste ]";
		AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(expr));
		*/

		AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(string_arquivo));
		lexical.yylex();

	}

}
