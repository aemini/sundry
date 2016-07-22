public class Stack {

    public final int MAX_SIZE = 100;
    private int top;
    private int[] elements;

    public Stack() {
        top = -1;
        elements = new int[MAX_SIZE];
    }

    public boolean full() {
        return (top == MAX_SIZE - 1);
    }

    public boolean empty() {
        return (top == -1);
    }

    public void push(int x) {
        if (full()) {
            throw new RuntimeException("Error: Stack is full");
        }
        top++;
        elements[top] = x;
    }

    public int pop() {
        if (empty()) {
            throw new RuntimeException("Error: Stack is empty");
        }
        int temp = elements[top];
        elements[top] = 0;
        top--;
        return temp;
    }

}
