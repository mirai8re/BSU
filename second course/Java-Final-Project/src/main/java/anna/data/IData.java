package anna.data;

import java.io.IOException;


public interface IData {
    String readData() throws IOException;
    void writeData(String source);

}
