import java.io.FileReader;
import java.io.FileWriter;
import java.util.Scanner;


//Текст входного файла
//        /**
//         * @param args the command line arguments
//         */
//        public static void main(String[] args) {
//            // TODO code application logic here
//            int i /*jjjjj*/ = 0;
//            String s = "\t"; String s1 = "/*hello"; String s2 = ", world!*/";
//            char c = '\t';
//            char cc = '/';
//            String str = "'";//COMMENT
//            char ccc = '*';
//            char cccc = '"'; //"hjhkjhkj
//            System.out.println("/*dfsdf*////****/**//**Hello\", \\'world!\\");/**/ //
//            char cccc = 100/'*';
//            char f = '\\';
//            char f1 = '\n';
//            char f2 = '\"';
//            "".getBytes();
//System.out.println("Bye!");
//        }
//    }


//Текст выходного файла
//public static void main(String[] args) {
//
//        int i  = 0;
//        String s = "\t"; String s1 = "/*hello"; String s2 = ", world!*/";
//        char c = '\t';
//        char cc = '/';
//        String str = "'";
//        char ccc = '*';
//        char cccc = '"';
//        System.out.println("/*dfsdf*////****/**//**Hello\", \\'world!\\");
//        char cccc = 100/'*';
//        char f = '\\';
//        char f1 = '\n';
//        char f2 = '\"';
//        "".getBytes();
//
//        }



enum State {START, STR_BODY, CHR_BODY, CHR_SPEC_SYMBOL, SPEC_SYMBOL, SUSPECTED_STR, SUSPECTED_COMM, ONE_STR_COMM, DEFAULT_COMM, STAR}
public class Main {
    public static void main(String[] args) throws Exception {
        FileReader fr = new FileReader("/Users/anna/Desktop/input.txt");
        FileWriter fw = new FileWriter("/Users/anna/Desktop/output.txt");
        Scanner sc = new Scanner(fr);
        State state = State.START;
        StringBuilder input_str = new StringBuilder();
        StringBuilder output_str = new StringBuilder();
        while (sc.hasNextLine()) {
            input_str.append(sc.nextLine() + "\n");
        }
        String str = input_str.toString();
        for(char symbol : str.toCharArray()){
            switch (state) {
                case START://начальное состояние автомата
                    if (symbol == '\'') {//проверка на наличие данных символов и переход в новое состояние, пока комментариев нет
                        output_str.append(symbol);
                        state = State.CHR_BODY;
                    } else if (symbol == '\"') {
                        output_str.append(symbol);
                        state = State.STR_BODY;
                    } else if (symbol == '/')
                        state = State.SUSPECTED_COMM;
                    else {
                        output_str.append(symbol);
                        state = State.START;
                    }
                    break;
                case CHR_BODY:
                    if (symbol == '\'') {
                        output_str.append(symbol);
                        state = State.START;
                    } else if (symbol == '\\') {
                        output_str.append(symbol);
                        state = State.CHR_SPEC_SYMBOL;
                    }
                    else {
                        output_str.append(symbol);
                        state = State.CHR_BODY;
                    }
                    break;
                case STR_BODY:
                    if (symbol == '\"') {
                        output_str.append(symbol);
                        state = State.SUSPECTED_STR;
                    }
                    else if (symbol == '\\') {
                        output_str.append(symbol);
                        state = State.SPEC_SYMBOL;
                    } else {
                        output_str.append(symbol);
                        state = State.STR_BODY;
                    }
                    break;
                case SPEC_SYMBOL:
                    output_str.append(symbol);
                    state = State.STR_BODY;
                    break;
                case CHR_SPEC_SYMBOL:
                    output_str.append(symbol);
                    state = State.CHR_BODY;
                    break;
                case SUSPECTED_STR:
                    if (symbol == '\"') {
                        output_str.append(symbol);
                        state = State.STR_BODY;
                    } else {
                        output_str.append(symbol);
                        state = State.START;
                    }
                    break;
                case SUSPECTED_COMM:// предпологаемые комментарии, считывание символа и переход в новое состояние
                    if (symbol == '/') {
                        state = State.ONE_STR_COMM;
                    } else if (symbol == '*') {
                        state = State.DEFAULT_COMM;
                    } else if (symbol == '\'') {
                        output_str.append("/" + symbol);
                        state = State.CHR_BODY;
                    }
                    else {
                        output_str.append("/");
                        state = State.START;
                    }
                    break;
                case ONE_STR_COMM:
                    if (symbol == '\n') {
                        output_str.append(symbol);
                        state = State.START;
                    } else {
                        state = State.ONE_STR_COMM;
                    }
                    break;
                case DEFAULT_COMM:
                    if (symbol == '*') {
                        state = State.STAR;
                    } else {
                        state = State.DEFAULT_COMM;
                    }
                    break;
                case STAR:
                    if (symbol == '/') {
                        state = State.START;
                    } else {
                        state = State.DEFAULT_COMM;
                    }
                    break;
            }
        }
        fw.write(output_str.toString());
        fw.close();
    }


}



