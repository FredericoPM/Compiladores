import java.util.Stack;

public class Cool{

    private Stack<String> stack = new Stack<>();

    public void string(String input){
        if(input.indexOf(null) != -1)
            this.erro("String contains null character");
        else if(input.indexOf("\n") != -1 && input.charAt(input.indexOf("\n")-1) != '\'')
            this.erro("Unterminated string constant");
        else if(input.charAt(input.length()-1) != '"')
            System.out.println("ERROR: EOF in string constant");
        else if(input.length() > 1025)
            this.erro("String constant too long");
        

        System.out.println(input);
        this.stack.push(input);
    }
    public void integer(String input){
        System.out.println(input);
        this.stack.push(input);
    }
    public void comment(String input){
        if(input.charAt(input.length()-1) != ')' && input.charAt(input.length()-2) != '*' )
            System.out.println("ERROR: EOF in comment");
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
