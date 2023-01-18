package anna.readers;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class ReaderTXT {
    public static String readData(String filename) throws FileNotFoundException {
        char[] buffer = null;
        File file = new File(filename);
        try (FileReader reader = new FileReader(file)) {
            buffer = new char[(int) file.length()];
            reader.read(buffer);} catch (IOException ex) {
            System.out.println(ex.getMessage());}
        return new String(buffer);
    }
}
