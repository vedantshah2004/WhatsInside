package com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
public class WhatsInsideApplication {

	public static void main(String[] args) {
		SpringApplication.run(WhatsInsideApplication.class, args);
	}
	
	@Bean
	PasswordEncoder getencoder()
	{
			return new BCryptPasswordEncoder();
	}

}
