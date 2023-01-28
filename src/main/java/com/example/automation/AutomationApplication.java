package com.example.automation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;

@SpringBootApplication
public class AutomationApplication {

	@GetMapping
	public String message(){
		return "Welcome to Automation Code";
	}
	public static void main(String[] args) {
		SpringApplication.run(AutomationApplication.class, args);
	}

}
