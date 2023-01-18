package anna.zip;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class ZIPWriterXML {
    public static void ZIPWriterXML(String[] args) {
        String filename = "input.xml";
        try(ZipOutputStream zipOutputStream = new ZipOutputStream(new FileOutputStream("outputXML.zip"));
            FileInputStream fileInputStream= new FileInputStream(filename);) {
            ZipEntry entry1 = new ZipEntry("input.xml");
            zipOutputStream.putNextEntry(entry1);
            byte[] buffer = new byte[fileInputStream.available()];
            fileInputStream.read(buffer);
            zipOutputStream.write(buffer);
            zipOutputStream.closeEntry();} catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
}
