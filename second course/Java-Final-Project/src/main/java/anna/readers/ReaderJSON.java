package anna.readers;

import anna.calculation.Calculator;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.Scanner;

public class ReaderJSON {
    public static int result;
    public static void read() {
        JSONObject json = new JSONObject();
        try {Scanner scanner = new Scanner(System.in);
            System.out.println("Enter string for calculation ");
            String stringInput = scanner.next();
            result = Calculator.printAnswer(Calculator.expressionToReversePolandNotation(stringInput.split("\\s")));
            JSONObject l=json.put("Arithmetical expression", stringInput);
        } catch (JSONException e) {
            e.printStackTrace();}
        try (PrintWriter out = new PrintWriter(new FileWriter("input.json"))) {
            out.write(json.toString());} catch (Exception e) {
            e.printStackTrace();
        }
    }

}
