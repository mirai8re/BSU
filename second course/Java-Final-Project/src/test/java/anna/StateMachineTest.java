package anna;



import anna.calculation.StateMachine;

import java.util.List;
import static anna.calculation.StateMachine.expr;
import static anna.calculation.StateMachine.lexAnalyze;
import static junit.framework.TestCase.assertEquals;

class StateMachineTest {
    @org.junit.jupiter.api.Test
    public void testSolvingExpression1() {
    String expressionText = "122 - 34 - 3* (55 + 5* (3 - 2)) * 2";
    List<StateMachine.Lexeme> lexemes = lexAnalyze(expressionText);
    StateMachine.LexemeBuffer lexemeBuffer = new StateMachine.LexemeBuffer(lexemes);
    int actual = expr(lexemeBuffer);
    assertEquals(-272, actual);
    }

    @org.junit.jupiter.api.Test
    public void testSolvingExpression2() {
        String expressionText = "122/0";
        List<StateMachine.Lexeme> lexemes = lexAnalyze(expressionText);
        StateMachine.LexemeBuffer lexemeBuffer = new StateMachine.LexemeBuffer(lexemes);
        int actual = expr(lexemeBuffer);
        assertEquals("Division by zero", actual);
    }

    @org.junit.jupiter.api.Test
    public void testSolvingExpression3() {
        String expressionText = "3-9";
        List<StateMachine.Lexeme> lexemes = lexAnalyze(expressionText);
        StateMachine.LexemeBuffer lexemeBuffer = new StateMachine.LexemeBuffer(lexemes);
        int actual = expr(lexemeBuffer);
        assertEquals(-6, actual);
    }





}