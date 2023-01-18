package anna;

import org.junit.jupiter.api.Test;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.dom.DOMSource;
import java.io.IOException;

import static org.junit.jupiter.api.Assertions.*;

class ReaderXMLTest {
    @Test
    void test1() throws  ParserConfigurationException, IOException, SAXException {
        String string1 = "Burov";
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
        builder = factory.newDocumentBuilder();
        Document doc = builder.newDocument();
        DOMSource source = new DOMSource(doc);
        Document doc2 = dBuilder.parse("Test.xml");
        doc2.getDocumentElement().normalize();
        NodeList nList = doc2.getElementsByTagName("String");
        String string2 = null;
        for (int temp = 0; temp < nList.getLength(); temp++) {
            Node nNode = nList.item(temp);
            if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                Element eElement = (Element) nNode;
                string2 = eElement.getElementsByTagName("string").item(0).getTextContent();
            }
        }
        assertEquals(string1, string2);
    }
}

