import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.util.Scanner;



public class Tester {

	public static void main(String[] args) throws IOException{

		String arquivo ="";
		Scanner scan = new Scanner(new File("testes/test.cl.skel"));
        while(scan.hasNextLine()){
            arquivo = arquivo.concat(scan.nextLine());
        }
		AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(arquivo));
		lexical.yylex();
	}

}
