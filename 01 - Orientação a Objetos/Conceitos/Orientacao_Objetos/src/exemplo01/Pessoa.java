package exemplo01;

import javax.swing.JOptionPane;

public class Pessoa {

	// Attributes
	String nome;
	int idade;
	double altura;

	// Método para obter os dados
	void obterDdos() {
		nome = JOptionPane.showInputDialog("Informe seu nome:");
		idade = Integer.parseInt(JOptionPane.showInputDialog("Informe sua idade:"));
		altura = Double.parseDouble( JOptionPane.showInputDialog("Informe sua altura:"));
	}
	
	// Método para retornar os dados
	void retornarDados() {
		String mensagem = "Nome: " + nome;
			   mensagem += "\nIdade: " + idade;
			   mensagem += "\nAltura: " + altura;
			   
		JOptionPane.showMessageDialog(null, mensagem);

	} 

}
