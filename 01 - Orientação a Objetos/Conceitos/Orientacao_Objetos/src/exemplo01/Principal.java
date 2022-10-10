package exemplo01;

import java.util.ArrayList;

public class Principal {

	public static void main(String[] args) {
	
		// Instanciar um objeto
		// Pessoa p = new Pessoa();
		// p.obterDdos();
		// p.retornarDados();
		
		// Armazenar pessoas
		ArrayList<Pessoa> dados = new ArrayList<>();
		
		// Obter dados e armazenar no ArrayList
		for(int i = 0; i < 3; i++) {
			
			Pessoa p = new Pessoa();
			p.obterDdos();
			
			dados.add(p);
			
		}
		
		//Listar os dados do ArrayList
		for(int i = 0; i < dados.size(); i++) {
			System.out.println(dados.get(i).nome);
			System.out.println(dados.get(i).idade);
			System.out.println(dados.get(i).altura);
			System.out.println("---------------------");
		}

	}

}
