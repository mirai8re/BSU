package anna.GUI;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class GUICalculator extends JFrame implements ActionListener {
    static JFrame jFrame;
    public double num;

    public ActionEvent actionEvent;
    static JTextField jTextField;


    String str1, str2, str3;

    public GUICalculator() {
        str1 = str2 = str3 = "";
    }


    // main function
    public static void main() {

        jFrame = new JFrame("calculator");

        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }

        GUICalculator calculator = new GUICalculator();

        jTextField = new JTextField(16);

        jTextField.setEditable(false);

        JButton b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, bPLUS, bMINUS, bDIVISION, bMULTIPLY, bPOINT, bC, bEQUAL;

        b0 = new JButton("0");
        b1 = new JButton("1");
        b2 = new JButton("2");
        b3 = new JButton("3");
        b4 = new JButton("4");
        b5 = new JButton("5");
        b6 = new JButton("6");
        b7 = new JButton("7");
        b8 = new JButton("8");
        b9 = new JButton("9");

        bEQUAL = new JButton("=");
        bPLUS = new JButton("+");
        bMINUS = new JButton("-");
        bDIVISION = new JButton("/");
        bMULTIPLY = new JButton("*");
        bC = new JButton("C");
        bPOINT = new JButton(".");

        JPanel p = new JPanel();
        bMULTIPLY.addActionListener(calculator);
        bDIVISION.addActionListener(calculator);
        bMINUS.addActionListener(calculator);
        bPLUS.addActionListener(calculator);
        b9.addActionListener(calculator);
        b8.addActionListener(calculator);
        b7.addActionListener(calculator);
        b6.addActionListener(calculator);
        b5.addActionListener(calculator);
        b4.addActionListener(calculator);
        b3.addActionListener(calculator);
        b2.addActionListener(calculator);
        b1.addActionListener(calculator);
        b0.addActionListener(calculator);
        bPOINT.addActionListener(calculator);
        bC.addActionListener(calculator);
        bEQUAL.addActionListener(calculator);
        p.add(jTextField);
        p.add(bPLUS);
        p.add(b1);
        p.add(b2);
        p.add(b3);
        p.add(bMINUS);
        p.add(b4);
        p.add(b5);
        p.add(b6);
        p.add(bMULTIPLY);
        p.add(b7);
        p.add(b8);
        p.add(b9);
        p.add(bDIVISION);
        p.add(bPOINT);
        p.add(b0);
        p.add(bC);
        p.add(bEQUAL);
        p.setBackground(Color.GREEN);
        jFrame.add(p);
        jFrame.setSize(200, 220);
        jFrame.show();
    }
    public void actionPerformed(ActionEvent e) {
        String string = e.getActionCommand();
        if ((string.charAt(0) >= '0' && string.charAt(0) <= '9') || string.charAt(0) == '.') {
            if (!str2.equals(""))
                str3 = str3 + string;
            else
                str1 = str1 + string;
            jTextField.setText(str1 + str2 + str3);

        } else if (string.charAt(0) == 'C') {
            str1 = str2 = str3 = "";
            jTextField.setText(str1 + str2 + str3);
        } else if (string.charAt(0) == '=') {
            double operation;
            if (str2.equals("+"))
                operation = (Double.parseDouble(str1) + Double.parseDouble(str3));
            else if (str2.equals("-"))
                operation = (Double.parseDouble(str1) - Double.parseDouble(str3));
            else if (str2.equals("/"))
                operation = (Double.parseDouble(str1) / Double.parseDouble(str3));
            else
                operation = (Double.parseDouble(str1) * Double.parseDouble(str3));
            jTextField.setText(str1 + str2 + str3 + "=" + operation);
            str1 = Double.toString(operation);
            str2 = str3 = "";
        } else {
            if (str2.equals("") || str3.equals(""))
                str2 = string;
            else {
                if (str2.equals("+"))
                    num = (Double.parseDouble(str1) + Double.parseDouble(str3));
                else if (str2.equals("-"))
                    num = (Double.parseDouble(str1) - Double.parseDouble(str3));
                else if (str2.equals("/"))
                    num = (Double.parseDouble(str1) / Double.parseDouble(str3));
                else
                    num = (Double.parseDouble(str1) * Double.parseDouble(str3));
                str1 = Double.toString(num);
                str2 = string;
                str3 = "";
            }
            jTextField.setText(str1 + str2 + str3);
        }
    }
}

