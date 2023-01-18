package anna.writers;

import anna.readers.ReaderJSON;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.FileWriter;
import java.io.PrintWriter;

public class WriterJSON {
    public static Object write()
    {
        String path = "output.json";
        JSONObject jsonObject = new JSONObject();
        try {
            ReaderJSON.read();
            int result=ReaderJSON.result;
            jsonObject.put("Answer",String.valueOf(result));
        } catch (JSONException e) {
            e.printStackTrace();
        }try (PrintWriter out = new PrintWriter(new FileWriter(path))) {
            out.write(jsonObject.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }return null;
    }
}
