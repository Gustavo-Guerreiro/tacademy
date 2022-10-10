import java.time.LocalDate;

import javax.swing.JOptionPane;

/** Classe que representa um produto a ser registrado em uma loja.
 * <p>Possue como atributos:</p>
 * <ul> 
 * <li>descricao (String): representa a descrição do produto. </li>
 * <li>valor (float): representa o preço do produto. </li>
 * <li>quantidadeEstoque (int): representa a quantidade do produto no estoque</li>
 * </ul>
 */
public class Produto extends Registro {
    String descricao;
    float valor;
    int quantidadeEstoque;
    Marca marca;

    public Produto(String nome, String descricao, float valor, int qtd, Marca marca){
        if (marca != null){
            setNome(nome);
            setDescricao(descricao);
            setvalor(valor);
            setQuantidadeEstoque(qtd);
            setDataCadastro(LocalDate.now());
            setMarca(marca);
        } else {
            throw new IllegalArgumentException("Nenhuma marca inserida.");
        }
    }

    public void exibirNome() {
        if (!this.getNome().isBlank()){
            JOptionPane.showConfirmDialog(null,
                "O nome deste produto é: " + this.getNome());
        }
    }

    public String getDescricao() {
        return this.descricao;
    }

    public void setDescricao(String descricao) {
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
        if (marca != null) {
            this.marca = marca;
        } else {
            throw new IllegalArgumentException("A marca é obrigatória");
        }
    }

    /** Exibe uma breve descrição sobre o que Produto presenta e faz 
     */
    public static void sobre() {
        String mensagem = "Os produtos orbigatoriamente devem ser cadastrados com: \n"
                        + "- Nome;\n"
                        + "- Descrição;\n"
                        + "- Valor;\n"
                        + "- Quantidade em estoque;\n"
                        + "- Marca.";
        JOptionPane.showMessageDialog(null, mensagem);
    }

}