import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.util.Scanner;

/*
	Classe criada para ler o arquivo "test.cl.skel", arquivo de exemplo da linguagem Cool,
	e processá-lo com o analisador lêxico. O analisador lêxico retorna uma pilha de TOKENS.

*/

public class Tester {

	public static void main(String[] args) throws IOException{

		String arquivo ="";
		Scanner scan = new Scanner(new File("test.cl.skel"));
        while(scan.hasNextLine()){
            arquivo = arquivo.concat(scan.nextLine());
        }
		AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(arquivo));
		lexical.yylex();
	}

}
