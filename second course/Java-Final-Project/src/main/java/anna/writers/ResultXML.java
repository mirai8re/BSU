package anna.writers;

import anna.writers.WriterXML;
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

public class ResultXML {
    public static void result()
    {
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder;
        try {
            documentBuilder = documentBuilderFactory.newDocumentBuilder();
            Document doc = documentBuilder.newDocument();
            Element rootElement = doc.createElementNS(";", "L");
            doc.appendChild(rootElement);
            Scanner scanner=new Scanner(System.in);
            int result= WriterXML.write();
            String toString=Integer.toString(result);
            rootElement.appendChild(getString(doc,"String",toString,"input"));
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            DOMSource source = new DOMSource(doc);
            StreamResult streamResult = new StreamResult(new File("output.xml"));
            transformer.transform(source, streamResult);
            System.out.println("file is ready");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static Node getString(Document document, String id, String str1, String str2)
    {
        Element String= document.createElement("String");
        String.appendChild(getStringElements(document,String,"string",str1));
        return String;
    }

    public static Node getStringElements(Document document, Element element, String str1, String str2)
    {
        Element node = document.createElement(str1);
        node.appendChild(document.createTextNode(str2));
        return node;
    }
}
