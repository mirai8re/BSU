package anna;

import anna.readers.ReaderTXT;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import static org.junit.jupiter.api.Assertions.*;

class ReaderTXTTest {
    @Test
    void readData() throws IOException {
        char[] buffer = null;
        File file=new File("TXTTest");
        FileReader reader = new FileReader(file);
        buffer = new char[(int) file.length()];
        reader.read(buffer);
        assertEquals("hababa", ReaderTXT.readData("TXTTest"));
    }
}