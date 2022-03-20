import java.util.Stack;

public class Cool{

    private Stack<String> stack = new Stack<>();

    public void string(String input){
        this.stack.push(input);
    }
    public void integer(String input){
        this.stack.push(input);
    }
}