package anna;

import anna.readers.ReaderTXT;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import static org.junit.jupiter.api.Assertions.*;

class WriterTXTTest {
    @Test
    void writeData() throws IOException {
        File file = new File("WriterTXTTest.txt");
        FileOutputStream fos = new FileOutputStream(file);
        String data="dagada";
        fos.write(data.getBytes(), 0, data.length());
        assertEquals(data, ReaderTXT.readData("WriterTXTTest.txt"));
    }

}