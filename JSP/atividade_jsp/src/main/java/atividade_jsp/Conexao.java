package atividade_jsp;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
	
	private Connection conexao = null;
	
	public Connection efetuarConexao() {
		try {
			conexao = DriverManager.getConnection("jdbc:mysql://localhost/atividade", "root", "admin");
			System.out.println("Conexão efetuada com sucesso!");
		} catch(Exception erro) {
			System.out.println(erro.getMessage());
		}
		
		return conexao;
	}
}
