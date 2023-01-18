package anna.writers;

import anna.calculation.Calculator;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;

public class WriterXML {
    public static int result;
    public static int write() throws ParserConfigurationException {
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder = documentBuilderFactory.newDocumentBuilder();
        try {
            File fXmlFile = new File("input.xml");
            Document document = dBuilder.parse(fXmlFile);
            document.getDocumentElement().normalize();
            NodeList nList = document.getElementsByTagName("String");
            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);
                if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element eElement = (Element) nNode;
                    System.out.println("String : " + eElement.getElementsByTagName("string").item(0).getTextContent());
                    String k = eElement.getElementsByTagName("string").item(0).getTextContent();
                    result = Calculator.printAnswer(Calculator.expressionToReversePolandNotation(k.split("\\s")));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

}
