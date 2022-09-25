package com.example.springprojectciti;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.example.springprojectciti.controller.LoginController;

@SpringBootApplication
@ComponentScan("com.example.springprojectciti")
public class SpringProjectCitiApplication {

	public static void main(String[] args) {
		
		SpringApplication.run(SpringProjectCitiApplication.class, args);
		
	}

}
