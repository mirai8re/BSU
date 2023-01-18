package anna.zip;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class ZIPReaderJSON {
    public static void ZIPReaderJSON(String[] args) {
        try(ZipInputStream zipInputStream = new ZipInputStream(new FileInputStream("outputJSON.zip"))) {
            ZipEntry entry;
            String name;
            long size;
            while((entry=zipInputStream.getNextEntry())!=null){
                name = entry.getName();
                size=entry.getSize();
                System.out.printf("File name: %s \t File size: %d \n", name, size);
                FileOutputStream fileOutputStream = new FileOutputStream("new" + name);
                for (int i = zipInputStream.read(); i != -1; i = zipInputStream.read()) {
                    fileOutputStream.write(i);}
                fileOutputStream.flush();
                zipInputStream.closeEntry();
                fileOutputStream.close();
            }
        } catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
}
