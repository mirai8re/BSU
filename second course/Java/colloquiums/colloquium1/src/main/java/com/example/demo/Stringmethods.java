package com.example.demo;
public class Stringmethods {
    private String str1;
    private String str2;
    public String res = "";

//    public void concatString(String str1, String str2) {
//        if (str1 != null)
//            res += str2;
//    }

    public String concatString(String str1, String str2) {
        if (str1 != null)
            str1 += str2;
        res = str1;
        return res;
    }

//    public  void multiplicateString(String str1, int n)
//    {
//        if (str1 != null && n > 0) {
//            StringBuilder strBuild = new StringBuilder(str1);
//            for (int i = 1; i < n; i++) {
//                strBuild.append(str1);
//            }res = strBuild.toString();
//        }
//        else {
//            res = "";
//        }
//    }

    public  String multiplicateString(String str1, int n)
    {
        if (str1 != null && n > 0) {
            StringBuilder strBuild = new StringBuilder(str1);
            for (int i = 1; i < n; i++) {
                strBuild.append(str1);
            }res = strBuild.toString();

        }
        else {
            res = "";
        }return res;
    }

    String getStringRes(){
        return res;
    }
}
