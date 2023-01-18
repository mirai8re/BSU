package anna.zip;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class ZIPWriterJSON {
    public static void ZIPWriterJSON(String[] args) {
        String filename = "input.json";
        try(ZipOutputStream zipOutputStream = new ZipOutputStream(new FileOutputStream("outputZSON.zip"));
            FileInputStream fileInputStream= new FileInputStream(filename);) {
            ZipEntry entry1 = new ZipEntry("input.json");
            zipOutputStream.putNextEntry(entry1);
            byte[] buffer = new byte[fileInputStream.available()];
            fileInputStream.read(buffer);
            zipOutputStream.write(buffer);
            zipOutputStream.closeEntry();
        } catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
}
