package anna.calculation;

import java.util.Stack;

public class Calculator {
    private static int getPriority(char token) {
        if (token == '*' || token == '/') {
            return 3;
        } else if (token == '+' || token == '-') {
            return 2;
        } else if (token == '(') {
            return 1;
        } else if (token == ')') {
            return -1;
        } else return 0;
    }

    public static String expressionToReversePolandNotation(String[] expr) {
        String current = "";
        Stack<Character> stack = new Stack<>();
        int priority, index;
        for (index = 0; index < expr.length; index++) {
            for (int i = 0; i < expr[index].length(); i++) {
                priority = getPriority(expr[index].charAt(i));
                if (priority == 0) {
                    current += expr[index].charAt(i);
                }
                if (priority == 1) {
                    stack.push(expr[index].charAt(i));
                }
                if (priority > 1) {
                    current += ' ';
                    while (!stack.empty()) {
                        if (getPriority(stack.peek()) >= priority) current += stack.pop();
                        else break;
                    }
                    stack.push(expr[index].charAt(i));
                }
                if (priority == -1) {
                    current += ' ';
                    while (getPriority(stack.peek()) != 1) current += stack.pop();
                    stack.pop();
                }

            }
        }
        while (!stack.empty()) current += stack.pop();
        return current;
    }

    public static int printAnswer(String str) {
        String operand = new String();
        Stack<Integer> stack = new Stack<>();
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) == ' ')
                continue;
            if (getPriority(str.charAt(i)) == 0) {
                while (str.charAt(i) != ' ' && getPriority(str.charAt(i)) == 0) {
                    operand += str.charAt(i++);
                    if (i == str.length()) break;
                }
                stack.push(Integer.parseInt(operand));
                operand = new String();
            }
            if (getPriority(str.charAt(i)) > 1) {
                int a = stack.pop();
                int b = stack.pop();
                if (str.charAt(i) == '+') stack.push(b + a);
                if (str.charAt(i) == '-') stack.push(b - a);
                if (str.charAt(i) == '*') stack.push(b * a);
                if (str.charAt(i) == '/') stack.push(b / a);
            }
        }
        return stack.pop();
    }
}
