package anna.GUI;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;

class UI extends JFrame
{
    private JRadioButton txt = new JRadioButton("TXT file will be created");
    private JRadioButton xml = new JRadioButton("XML file will be created");
    private JRadioButton json = new JRadioButton("JSON file will be created");

    private int width = 666;
    private Image img;

    private JFrame  viewForm;
    private int height = 666;
    public UI() {
        super("Choose the type of file");
        this.setBounds(200, 200, 400, 200);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        Container container = this.getContentPane();
        container.setLayout(new GridLayout(3, 2, 2, 2));
        ButtonGroup group = new ButtonGroup();
        group.add(txt);
        group.add(xml);
        group.add(json);
        container.add(txt);
        txt.setSelected(false);
        container.add(json);
        container.add(xml);
        setSize(width, height);
        setTitle("File Monitor");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setResizable(false);
        setVisible(true);
    }
    class ButtonEvent implements ActionListener {
        public void actionPerformed (ActionEvent e)  {
          GUI gui=new GUI();
            String message = "";
            message += "Button was pressed\n";
            if (txt.isSelected()) {
                message += "TXT file will be created";
                try {
                    gui.txt();
                } catch (IOException ex) {
                    throw new RuntimeException(ex);
                }
            } else if (xml.isSelected()) {
                message += "XML file will be created";
                gui.XML();
            } else if (json.isSelected()) {
                message += "JSON file will be created";
                gui.JSON();
            }
        }
    }
}


