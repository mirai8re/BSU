package anna.writers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

public class WriterTXT {
    static public  String filename;
    public  static void writeData(String data)
    {
        File file = new File(filename);
        try (FileOutputStream fileOutputStream = new FileOutputStream(file)) {
            fileOutputStream.write(data.getBytes(), 0, data.length());
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }

}
