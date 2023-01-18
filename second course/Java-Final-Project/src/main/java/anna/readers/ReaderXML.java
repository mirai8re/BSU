package anna.readers;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.File;
import java.util.Scanner;

public class ReaderXML {
    public static short read() {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        try {builder = factory.newDocumentBuilder();
            Document doc = builder.newDocument();
            Element rootElement = doc.createElementNS(";", "L");
            doc.appendChild(rootElement);
            Scanner scanner = new Scanner(System.in);
            System.out.println("Enter string for calculation ");
            String inputString;
            inputString = scanner.next();
            rootElement.appendChild(getString(doc, "String", inputString, "input"));
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            DOMSource source = new DOMSource(doc);
            StreamResult file = new StreamResult(new File("input.xml"));
            transformer.transform(source, file);
            System.out.println("XML was created");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static Node getString(Document doc, String id, String string1, String string2) {
        Element String=doc.createElement("String");
        String.appendChild(getStringElements(doc,String,"string",string1));
        return String;
    }

    public static Node getStringElements(Document doc, Element element, String string1, String string2) {
        Element node = doc.createElement(string1);
        node.appendChild(doc.createTextNode(string2));
        return node;
    }

}
