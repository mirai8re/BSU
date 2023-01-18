package anna;

import org.json.JSONException;
import org.json.JSONObject;
import org.junit.jupiter.api.Test;

import java.io.IOException;

import static org.junit.jupiter.api.Assertions.*;

class ReaderJSONTest {
    public static String string = " rake";

    @Test
    void main() throws IOException {
        JSONObject json = new JSONObject();
        String file = "Test.json";
        try {
            JSONObject object = json.put("code should be simple as", string);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        assertEquals("{\"code should be simple as\":\" rake\"}", json.toString());
    }

}