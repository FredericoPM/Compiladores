import java.util.Stack;
/* 
    Classe criada para administrar a pilha de tokens.
    Além de tratar erros da análise léxica.

*/
public class Cool{

    private Stack<String> stack = new Stack<>();
    // procedimento string executado quando um TOKEN {STR} é encontrado
    public void string(String input){
        
        if(input.indexOf("\n") != -1 && input.charAt(input.indexOf("\n")-1) != '\'')
            this.erro("Unterminated string constant");
        else if(input.charAt(input.length()-1) != '"')
            System.out.println("ERROR: EOF in string constant");
        else if(input.length() > 1025)
            this.erro("String constant too long");
        else{
            if(input == null){
                this.erro("String contains null character");
            }
            else{
                for(int i=0; i<input.length();i++){
                    if(input.substring(i, i+1) == null){
                        this.erro("String contains null character");
                        break;
                    }
                }
            }
        }
        System.out.println(input);
        this.stack.push(input);
    }
    // procedimento integer executado quando um TOKEN {INT} é encontrado
    public void integer(String input){
        System.out.println(input);
        this.stack.push(input);
    }
    // procedimento comment executado quando um TOKEN {COMMENT_TYPE1} ou {COMMENT_TYPE2} é encontrado
    public void comment(String input){
        if(input.charAt(input.length()-1) != ')' && input.charAt(input.length()-2) != '*' )
            System.out.println("ERROR: EOF in comment");
        System.out.println(input);
        this.stack.push(input);
    }
    // procedimento key_word executado quando um TOKEN {KEY_WORDS} é encontrado
    public void key_word(String input){
        System.out.println(input);
        this.stack.push(input);
    }
    // procedimento white_space executado quando um TOKEN {WHITE_SPACE} é encontrado
    public void white_space(String input){
        System.out.println(input);
        this.stack.push(input);
    }
    // procedimento id executado quando um TOKEN {ID} é encontrado
    public void id(String input){
        System.out.println(input);
        this.stack.push(input);
    }
    // procedimento operator executado quando um TOKEN {OPERATOR} é encontrado
    public void operator(String input){
        System.out.println(input);
        this.stack.push(input);
    }
    // procedimento markdown executado quando um TOKEN {MARKDOWN} é encontrado
    public void markdown(String input){
        System.out.println(input);
        this.stack.push(input);
    }
    // procedimento erro executado quando um TOKEN de erro é encontrado
    public void erro(String input){
        System.out.println(input);
        this.stack.push("ERROR: " + input);
    }
}
