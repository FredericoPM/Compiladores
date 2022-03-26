import java.util.Stack;

public class Cool{

    private Stack<String> stack = new Stack<>();

    public void string(String input){
        if(input.charAt(input.length()-1)== '\"')
            this.stack.push("ERROR: " + input);
        for(int i = 0; i < input.length()-2; i++){
            if(input.charAt(i) == '\0')
                this.stack.push("ERROR: " + input);
        }
        if(input.length() > 1025)
            this.stack.push("ERROR: " + input);
        System.out.println(input);
        this.stack.push(input);
    }
    public void integer(String input){
        System.out.println(input);
        this.stack.push(input);
    }
    public void comment(String input){
        if(input.charAt(input.length()-1)== ')' && input.charAt(input.length()-2)== '*' )
            this.stack.push("ERROR: " + input);
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
