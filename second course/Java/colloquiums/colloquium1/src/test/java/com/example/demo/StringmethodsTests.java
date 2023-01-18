package com.example.demo;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class StringmethodsTests {

	@Test
	void Test1() {
		Stringmethods st1 = new Stringmethods();
		Assertions.assertEquals("blablabla", st1.multiplicateString("bla", 3));
	}

	@Test
	void Test2() {
		Stringmethods st1 = new Stringmethods();
		Assertions.assertEquals("", st1.multiplicateString("bla", 0));
	}

	@Test
	void Test3() {
		Stringmethods st1 = new Stringmethods();
		Assertions.assertEquals("bla", st1.multiplicateString("bla", 1));
	}

	@Test
	void Test4() {
		Stringmethods st1 = new Stringmethods();
		Assertions.assertEquals("bla1", st1.concatString("bla", "1"));
	}


}
