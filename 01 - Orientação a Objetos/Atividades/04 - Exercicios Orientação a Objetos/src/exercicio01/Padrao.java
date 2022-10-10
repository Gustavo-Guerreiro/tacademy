package exercicio01;

public interface Padrao {
    public void cadastrar(String nome, String email, String telefone);
    public void listar();
    public void pesquisar(String nome);
    public void alterar();
    public void remover();
}