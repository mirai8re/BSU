package anna;

import org.json.JSONException;
import org.json.JSONObject;
import org.junit.jupiter.api.Test;

import java.io.IOException;

import static org.junit.jupiter.api.Assertions.*;

class WriterJSONTest {
    public static String string = " or not to be";
    @Test
    void test1() throws IOException {
        String path="Test.json";
        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("To be",WriterJSONTest.string);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        assertEquals("{\"To be\":\" or not to be\"}",jsonObject.toString());
    }

}