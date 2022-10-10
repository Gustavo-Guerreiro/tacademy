package exercicio01;

import java.util.ArrayList;

import javax.swing.JOptionPane;

public class Agenda implements Padrao {
  private ArrayList<Contato> contatos = new ArrayList<>();

  @Override
  public void cadastrar(String nome, String email, String telefone) {
    Contato c = new Contato(nome, email, telefone);
    contatos.add(c);
  }
  @Override
  public void listar() {
    String mensagem = "==================================\n";
    for (Contato c : contatos){
      mensagem += "Nome: " + c.getNome() + "\n"
                + "E-mail: " + c.getEmail() + "\n"
                + "Telefone: " + c.getTelefone() + "\n"
                + "==================================\n";
    }
    JOptionPane.showMessageDialog(null, mensagem);

  }
  @Override
  public void pesquisar(String nome) {
    String mensagem = "==================================\n";
    for (Contato c : contatos){
      if(c.getNome().equalsIgnoreCase(nome)){
        mensagem += "Nome: " + c.getNome() + "\n"
                  + "E-mail: " + c.getEmail() + "\n"
                  + "Telefone: " + c.getTelefone() + "\n"
                  + "================================== \n";
      }
    }
    JOptionPane.showMessageDialog(null, mensagem);

  }
  @Override
  public void alterar() {
    String mensagem = "==================================\n";
    int indice = 0;
    for (Contato c : contatos){
      mensagem += indice +") \n"
                + "Nome: " + c.getNome() + "\n"
                + "E-mail: " + c.getEmail() + "\n"
                + "Telefone: " + c.getTelefone() + "\n"
                + "==================================\n";
      indice++;
    }
    JOptionPane.showMessageDialog(null, mensagem);
    int numero = Integer.parseInt( JOptionPane.showInputDialog(null,
      "Digite o número do contato que deseja alterar:"));
    String nome = JOptionPane.showInputDialog(null, "Digite o novo nome:");
    String email = JOptionPane.showInputDialog(null, "Digite o novo email:");
    String telefone = JOptionPane.showInputDialog(null, "Digite o novo telefone:");

    contatos.remove(numero);
    contatos.add(new Contato(nome, email, telefone));


  }
  @Override
  public void remover() {
    String mensagem = "==================================\n";
    int indice = 0;
    for (Contato c : contatos){
      mensagem += indice +") \n"
                + "Nome: " + c.getNome() + "\n"
                + "E-mail: " + c.getEmail() + "\n"
                + "Telefone: " + c.getTelefone() + "\n"
                + "================================== \n";
      indice++;
    }
    JOptionPane.showMessageDialog(null, mensagem);
    int numero = Integer.parseInt( JOptionPane.showInputDialog(null,
      "Digite o número do contato que deseja excluir:"));
    contatos.remove(numero);
    JOptionPane.showMessageDialog(null, "Contato excluído");
  }

}