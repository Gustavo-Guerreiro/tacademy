/*
 * Cria uma interface com todos os métodos exigidos no problema.
 */
public interface Exigencias {
    // Métodos relacionados às marcas:
    public void cadastrar(Marca marca);
    public Marca selecionarMarca(String nome);
    public void listarMarcas();
    public void alterarMarca(String nome);
    public void removerMarca(String nome);

    // Métodos relacionados aos produtos:
    public void cadastrar(Produto produto);
    public Produto selecionarProduto(String nome);
    public void alterarProduto(String nome);
    public void removerProduto(String nome);
    public void pesquisarProduto(String termo);
}