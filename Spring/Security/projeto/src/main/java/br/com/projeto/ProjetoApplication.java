package br.com.projeto;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class ProjetoApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjetoApplication.class, args);

		//criptografia
		System.out.println("Administrador -> " + new BCryptPasswordEncoder().encode("123"));
		System.out.println("Usuário -> " + new BCryptPasswordEncoder().encode("abc"));
	}

}
