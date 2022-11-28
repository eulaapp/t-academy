package br.com.rotas;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class RotasApplication {

	public static void main(String[] args) {
		SpringApplication.run(RotasApplication.class, args);
	}

}
