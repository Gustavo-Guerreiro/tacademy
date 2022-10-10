package exercicio02;

public class Principal {
    public static void main(String[] args) {
        
        Estoque e = new Estoque();
        e.addProduto();
        e.addProduto();

        e.exibirProdutosCadastrados();
        
    }
}