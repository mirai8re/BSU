package anna.zip;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class ZIPWriter {
    public static void ZIP(String[] args) {
        String filename = "input.txt";
        try(ZipOutputStream zipOutputStream = new ZipOutputStream(new FileOutputStream("output.zip"));
            FileInputStream fileInputStream= new FileInputStream(filename);) {
            ZipEntry zipEntry = new ZipEntry("input.txt");
            zipOutputStream.putNextEntry(zipEntry);
            byte[] buffer = new byte[fileInputStream.available()];
            fileInputStream.read(buffer);
            zipOutputStream.write(buffer);
            zipOutputStream.closeEntry();}
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
}


