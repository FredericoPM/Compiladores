import java.util.Stack;

public class Cool{

    private Stack<String> stack = new Stack<>();

    public void string(String input){
        //* detectar strings com quebra de linha sem o escape
        //* string contendo caracteres nulos
        //* string too long
        System.out.println(input);
        this.stack.push(input);
    }
    public void integer(String input){
        System.out.println(input);
        this.stack.push(input);
    }
    public void comment(String input){
        //* detectar comentarios do tipo 2 sem o fechamento correto
        System.out.println(input);
        this.stack.push(input);
    }
    public void key_word(String input){
        System.out.println(input);
        this.stack.push(input);
    }
    public void white_space(String input){
        System.out.println(input);
        this.stack.push(input);
    }
    public void default_types(String input){
        System.out.println(input);
        this.stack.push(input);
    }
    public void id(String input){
        System.out.println(input);
        this.stack.push(input);
    }
    public void operator(String input){
        System.out.println(input);
        this.stack.push(input);
    }
    public void markdown(String input){
        System.out.println(input);
        this.stack.push(input);
    }
    public void erro(String input){
        System.out.println(input);
        this.stack.push("ERROR: " + input);
    }
}
