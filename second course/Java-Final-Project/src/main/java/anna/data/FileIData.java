package anna.data;

import anna.data.IData;

import java.io.*;

public class FileIData implements IData {
    private static String name;
    public FileIData(String name)
    {
        this.name = name;
    }

    @Override
    public  void writeData(String data) {
        File file = new File(name);
        try (FileOutputStream fos = new FileOutputStream(file)) {
            fos.write(data.getBytes(), 0, data.length());
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }

    @Override

    public  String readData() throws FileNotFoundException {
        char[] buffer = null;
        File file = new File(name);
        try (FileReader reader = new FileReader(file)) {
            buffer = new char[(int) file.length()];
            reader.read(buffer);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }return new String(buffer);
    }

}