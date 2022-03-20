import java.util.Stack;

public class Cool{

    private Stack<String> stack = new Stack<>();

    public void push(String input){
        this.stack.push(input);
    }

    public void doAction(){
        String topItem = this.stack.peek();
        if(topItem.equals("+")){

            this.stack.pop();
            int value1 = Integer.parseInt(this.stack.pop());
            int value2 = Integer.parseInt(this.stack.pop());
            this.stack.push(Integer.toString(value1 + value2));

        }else if(topItem.equals("s")){
            
            this.stack.pop();
            String value1 = this.stack.pop();
            String value2 = this.stack.pop();
            this.stack.push(value1);
            this.stack.push(value2);

        }
    }

    public void printStack(){
        this.stack.forEach(System.out::println);
    }
}