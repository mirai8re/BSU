package anna;

import anna.calculation.Calculator;
import anna.data.FileIData;
import anna.data.IData;
import anna.data.decorator.CompressionDecorator;
import anna.data.decorator.EncryptionDecorator;
import anna.data.decorator.IDataDecorator;
import anna.readers.ReaderXML;
import anna.writers.ResultXML;
import anna.writers.WriterJSON;
import anna.writers.WriterXML;

import javax.xml.parsers.ParserConfigurationException;
import java.io.*;
import java.util.Scanner;

public class Main {
    public static String line;
    public static void main(String[] args) throws IOException, ParserConfigurationException {
        Scanner scanner = new Scanner(System.in);
        System.out.println("" +
                "Enter filetype:"
                +"\n txt"
                +"\n json"
                +"\n xml");
        String input = scanner.next();
        if (input.trim().equalsIgnoreCase("txt")) {
            File fin = new File("input.txt");
            FileReader fileReader = new FileReader(fin);
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            FileWriter output = new FileWriter("output.txt");
            IDataDecorator encodedOutput = new CompressionDecorator(
                    new EncryptionDecorator(new FileIData("output.txt")));
            line = bufferedReader.readLine();
            IData plainOutput = new FileIData("output.txt");
            if (line != null) {encodedOutput.writeData(line);}
            output.write("- Input ----------------");
            while (line != null) {
                int answer = Calculator.printAnswer((Calculator.expressionToReversePolandNotation(line.split("\\s"))));
                output.write("\n" + answer + " ");
                line = bufferedReader.readLine();}
            output.write("\nDecoded --------------" +
                    "\n" +
                    plainOutput.readData() +
                    "\n" +
                    "- Encoded --------------" +
                    "\n" +
                    encodedOutput.readData() +
                    "\n" );
            output.close();
        }else if (input.trim().equalsIgnoreCase("xml")) {
            ReaderXML.read();
            WriterXML.write();
            ResultXML.result();
        } else if (input.trim().equalsIgnoreCase("json") || input.trim().equalsIgnoreCase("js")) {
            WriterJSON.write();
        }
        else{
            System.out.println("INCORRECT INPUT");
        }
    }
}