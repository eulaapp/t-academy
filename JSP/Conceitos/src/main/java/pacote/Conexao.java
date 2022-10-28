package pacote;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {

	// atributo contendo acesso ao bd
	private Connection con = null;
	
	// metodo para efetuar a conexão
	public Connection efetuarConexao() {
		
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost/jsp", "root", "admin");
			System.out.println("Conexão efetuada com sucesso!");
		} catch(Exception erro) {
			System.out.println(erro.getMessage());
		}
		
		return con;
	}
		
}
