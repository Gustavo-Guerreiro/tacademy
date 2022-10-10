/*
 * Cria uma interface com todos os métodos exigidos no problema.
 */
public interface Padrao {
    // Métodos relacionados às marcas:
    public void cadastrar(String nome);
    public Marca selecionarMarca(String nome);
    public void listarMarcas();
    public void alterarMarca(String nome);
    public void removerMarca(String nome);

    // Métodos relacionados aos produtos:
    public void cadastrar(String nome, String descricao, float valor, int qtd,
        Marca marca);
    public Produto selecionarProduto(String nome);
    public void listarProdutos();
    public void alterarProduto(String nome);
    public void removerProduto(String nome);
    public void pesquisarProduto(String termo);
}