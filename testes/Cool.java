import java.util.Stack;

public class Cool{

    private Stack<String> stack = new Stack<>();

    public void string(String input){
        this.stack.push(input);
    }
    public void integer(String input){
        this.stack.push(input);
    }
    public void comment(String input){
        this.stack.push(input);
    }
    public void key_word(String input){
        this.stack.push(input);
    }
    public void white_space(String input){
        this.stack.push(input);
    }
    public void default_types(String input){
        this.stack.push(input);
    }
}