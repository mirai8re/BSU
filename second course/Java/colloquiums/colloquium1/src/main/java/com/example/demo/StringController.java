package com.example.demo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StringController {
    @RequestMapping("/multiplicateString")
    public Stringmethods multiplicateString(@RequestParam(value = "str1") String str1,
                                            @RequestParam(value = "n") int n) {
        Stringmethods mulrstr = new Stringmethods();
        mulrstr.multiplicateString(str1, n);
        return mulrstr;
    }

    @RequestMapping("/concatString")
    public Stringmethods concatString(@RequestParam(value = "str1") String str1,
                                      @RequestParam(value = "str2") String str2) {
        Stringmethods concatstr = new Stringmethods();
        concatstr.concatString(str1, str2);
        return concatstr;
    }
}
