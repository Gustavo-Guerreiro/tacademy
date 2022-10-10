import java.time.LocalDate;

/** Classe que representa um produto a ser registrado em uma loja.
 * <p>Possue como atributos:</p>
 * <ul> 
 * <li>descricao (String): representa a descrição do produto. </li>
 * <li>valor (float): representa o preço do produto. </li>
 * <li>quantidadeEstoque (int): representa a quantidade do produto no estoque</li>
 * </ul>
 */
public class Produto extends Registro {
    private String descricao;
    private float valor;
    private int quantidadeEstoque;
    private Marca marca;

    public Produto(String nome, String descricao, float valor, int qtd, Marca marca){
        if (marca != null){
            setNome(nome);
            setDescricao(descricao);
            setvalor(valor);
            setQuantidadeEstoque(qtd);
            setDataCadastro(LocalDate.now());
            setMarca(marca);
            // adiciona o produto à sua marca correspondente
            marca.addProduto(this);
        } else {
            throw new IllegalArgumentException("Nenhuma marca inserida.");
        }
    }

    // Usando o polimorfismo, faz com que a classe retorne dados específicos do
    // produto para além do registro padrão.
    public String retornarDados(){
        String mensagem = "Nome: " + this.getNome() + "\n"
                        + "Data Cadastro: " +this.dataCadastro.toString() +"\n"
                        + "Descrição: " + this.getDescricao() + "\n"
                        + "Preço: R$" + String.format("%.2f", this.getValor()) + "\n"
                        + "Quantidade em estoque: " + this.getQuantidadeEstoque() + "\n"
                        + "Marca: " + this.marca.getNome() +"\n";
        return mensagem;
    }

    public String getDescricao() {
        return this.descricao;
    }

    public void setDescricao(String descricao) {

        // valida se descrição está em branco
        if(!descricao.isBlank()) {
            this.descricao = descricao;
        } else {
            throw new IllegalArgumentException("O cadastro de uma descrição é obrigatório.");
        }
    }

    public float getValor() {
        return this.valor;
    }

    public void setvalor(float valor) {
        // valida se o valor é negativo ou igual a zero
        if (valor > 0) {
            this.valor = valor;
        } else {
            if (valor == 0) {
                throw new IllegalArgumentException("O valor do produto não pode ser 0.");
            } else {
                throw new IllegalArgumentException("O valor do produto não pode ser negativo.");
            }
        }        
    }

    public int getQuantidadeEstoque() {
        return this.quantidadeEstoque;
    }

    public void setQuantidadeEstoque(int quantidadeEstoque) {
        // valida se a quantidade é negativa
        if (quantidadeEstoque >= 0) {
            this.quantidadeEstoque = quantidadeEstoque;
        } else {
            throw new IllegalArgumentException("A quantidade em estoque não pode ser negativa.");
        }
    }

    public Marca getMarca() {
        return this.marca;
    }

    public void setMarca(Marca marca){
        // não registra uma marca nula
        if (marca != null) {
            this.marca = marca;
        } else {
            throw new IllegalArgumentException("A marca é obrigatória");
        }
    }

}