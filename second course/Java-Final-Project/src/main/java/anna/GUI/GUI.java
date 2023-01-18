package anna.GUI;

import anna.calculation.Calculator;
import anna.readers.ReaderXML;
import anna.writers.ResultXML;
import anna.writers.WriterJSON;
import anna.writers.WriterXML;

import javax.xml.parsers.ParserConfigurationException;
import java.io.*;

public class GUI {
    public static String line;
    public static int  answer;
    public static void txt() throws IOException {
        File fin = new File("input.txt");
        FileReader fr = new FileReader(fin);
        BufferedReader reader = new BufferedReader(fr);
        try (FileWriter out = new FileWriter("output.txt")) {
            line = reader.readLine();
            while (line != null) {
                answer = Calculator.printAnswer((Calculator.expressionToReversePolandNotation(line.split("\\s"))));
                out.write("\n");
                out.write(answer + " ");
                line = reader.readLine();
            }
        }
        System.out.println( "TXT was created");
    }
    public static  void XML() {
        ReaderXML.read();
        try {
            WriterXML.write();
        } catch (ParserConfigurationException e) {
            throw new RuntimeException(e);
        }
        ResultXML.result();
        System.out.println( "XML was created");
    }
    public static  void JSON() {
        WriterJSON.write();
        System.out.println( "JSON was created");
    }




}
