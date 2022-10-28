package pacote;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
	
	// Atributo contendo o acesso ao banco de dados
	private Connection con = null;
	
	// Método para efetuar a conexão
	public Connection efetuarConexao() {
		
		// Tentativa
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost/jsp", "root", "admin");

			System.out.println("Conexão efetuada com sucesso!");
		} catch (Exception erro) {
			System.out.println(erro.getMessage());
		}
		
		// Retorno
		return con;
		
	}

}
