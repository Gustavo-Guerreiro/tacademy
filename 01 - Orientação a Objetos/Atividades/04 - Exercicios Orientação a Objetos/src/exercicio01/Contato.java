package exercicio01;

public class Contato {
  private String nome;
  private String email;
  private String telefone;

  public Contato(String nome, String email, String telefone){
    setNome(nome);
    setEmail(email);
    setTelefone(telefone);
  }

  public String getNome() {
    return this.nome;
  }

  public void setNome(String nome) {
    this.nome = nome;
  }

  public String getEmail() {
    return this.email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getTelefone() {
    return this.telefone;
  }

  public void setTelefone(String telefone) {
    this.telefone = telefone;
  }


}
