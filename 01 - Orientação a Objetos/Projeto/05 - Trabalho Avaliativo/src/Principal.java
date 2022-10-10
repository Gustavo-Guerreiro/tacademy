import java.util.HashMap;

import javax.swing.JOptionPane;
/** Classe principal, é aqui que os métodos exigidos
 * na questão foram implementados, os dados cadastrados
 * são salvos nessa classe também:
 * 
 */
public class Principal implements Padrao {
    HashMap<String, Marca> marcas = new HashMap<>();
    HashMap<String, Produto> produtos = new HashMap<>();
    /**  Cadastra uma nova marca
     * @param nome é o nome único da marca.
     */

    @Override
    public void cadastrar(String nome) {
        marcas.put(nome.toLowerCase(), new Marca(nome));
    }

    @Override
    public Marca selecionarMarca(String nome) {
        if (marcas.containsKey(nome.toLowerCase())){
            return marcas.get(nome.toLowerCase());
        } else {
            throw new IllegalArgumentException("Não existe uma marca com esse nome.");
        }
    }

    @Override
    public void listarMarcas(){
        String mensagem = "Marcas cadastradas: \n";
        for (Marca m : marcas.values()){
            mensagem += m.getNome() + "\n";
        }
        JOptionPane.showMessageDialog(null, mensagem);
    }

    @Override
    public void alterarMarca(String nome) {
        String novoNome = JOptionPane.showInputDialog(null, 
            "Digite o novo nome");
        Marca marca = marcas.get(nome.toLowerCase());
        if (!marcas.containsKey(nome.toLowerCase())){
            marca.setNome(novoNome);
            marcas.put(novoNome.toLowerCase(), marca);
            marcas.remove(nome);
        } else {
            throw new IllegalArgumentException("Uma marca com esse nome já foi cadastrada.");
        }
    }

    @Override
    public void removerMarca(String nome) {
        if (this.marcas.containsKey(nome.toLowerCase())){
            boolean existeMarca = false;
            for (Produto p : produtos.values()) {
                existeMarca = p.getMarca().getNome().toLowerCase().equals(nome.toLowerCase());
            }
            if (!existeMarca) {
                marcas.remove(nome.toLowerCase());
            } else {
                throw new IllegalArgumentException("Ainda há produtos vinculados a essa marca.");
            }
        } else {
            throw new IllegalArgumentException("Não existe uma marca com esse nome.");
        }
    }

    /**  Cadastra um novo produto.
     */
    @Override
    public void cadastrar(String nome, String descricao, float valor, int qtd, Marca marca) {
        boolean marcaExiste = marcas.containsKey(marca.getNome().toLowerCase());
        boolean produtoExiste = produtos.containsKey(nome.toLowerCase());
        if (marcaExiste && !produtoExiste){
            produtos.put(nome.toLowerCase(), new Produto(nome, descricao, valor, qtd, marca));
        } else {
            if (produtoExiste) {
                throw new IllegalArgumentException("Este produto já foi cadastrado.");
            }
            if (!marcaExiste) {
                throw new IllegalArgumentException("Marca não existe.");
            }
        }
    }

    @Override
    public Produto selecionarProduto(String nome) {
        if (this.produtos.containsKey(nome.toLowerCase())){
            return this.produtos.get(nome.toLowerCase());
        } else {
            throw new IllegalArgumentException("Não existe um produto com esse nome.");
        }
    }

    @Override
    public void listarProdutos(){
        String mensagem = "Produtos cadastrados: \n";
        int indice = 1;
        for (Produto p : produtos.values()) {
            mensagem += "\nProduto " + indice +")\n"
                      + "Nome: " + p.getNome() + "\n"
                      + "Descrição: " + p.getDescricao() + "\n"
                      + "Preço: R$" + String.format("%.2f", p.getValor()) + "\n"
                      + "Quantidade em estoque: " + p.getQuantidadeEstoque() + "\n";
        }
        JOptionPane.showInputDialog(null, mensagem);
    }

    @Override
    public void alterarProduto(String nome) {
        String mensagem = "Digite o número correspondente a alteração que deseja fazer:\n"
                        + "1 - Alterar descrição.\n"
                        + "2 - Alterar valor.\n."
                        + "3 - Alterar quantidade em estoque.\n";
        String opcao = JOptionPane.showInputDialog(null, mensagem).trim();
        
        Produto produto;
        switch(opcao) {
            case "1":
                String novaDesc = JOptionPane.showInputDialog(null, 
                    "Digite a nova descrição");
                produto = produtos.get(nome.toLowerCase());
                produto.setDescricao(novaDesc);
                break;
            case "2":
                Float novoValor = Float.parseFloat(JOptionPane.showInputDialog(null, 
                    "Digite o novo valor"));
                produto = produtos.get(nome.toLowerCase());
                produto.setvalor(novoValor);
                break;
            case "3":
                int novaQuantidade = Integer.parseInt(JOptionPane.showInputDialog(null, 
                "Digite a nova quantidade:"));
                produto = produtos.get(nome.toLowerCase());
                produto.setQuantidadeEstoque(novaQuantidade);
                break;
            default:
                JOptionPane.showMessageDialog(null, "Opçao Inválida.");
                break;
        }
    }

    @Override
    public void removerProduto(String nome) {
        if (this.produtos.containsKey(nome.toLowerCase())){
            this.produtos.remove(nome.toLowerCase());
        } else {
            throw new IllegalArgumentException("Não existe um produto com esse nome.");
        }
    }

    @Override
    public void pesquisarProduto(String termo) {
        
        
    }
}