
import java.util.HashMap;

/** Classe principal, é aqui que os métodos exigidos
 * na questão foram implementados, os dados cadastrados
 * são salvos nessa classe também:*/
public class Principal implements Exigencias {
    // hashmaps com as marcas/produtos cadastrados, os hashmaps facilitam a 
    // pesquisa por objetos por meio da chave-valor, sendo que a chave é o nome
    // registrado nos objetos em minúsculo (para não deixar que mais de um 
    // objeto com o mesmo nome seja cadastrado) e o valor é o objeto em si.
    private HashMap<String, Marca> marcas = new HashMap<>();
    private HashMap<String, Produto> produtos = new HashMap<>();

    @Override
    // Polimorfismo
    public void cadastrar(Marca marca) {
        // antes de cadastrar confere se a marca é nula ou não está cadastrada
        if (marca != null && !this.marcas.containsKey(marca.getNome().toLowerCase())){
            marcas.put(marca.getNome().toLowerCase(), marca);
        } else {
            if (marca == null) {
                throw new IllegalArgumentException("Marca não pode ser nula.");
            } else {
                throw new IllegalArgumentException("Marca já cadastrada");
            }
        }
    }

    @Override
    public Marca selecionarMarca(String nome) {
        // valida se a marca existe
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
            mensagem += "\n" + m.retornarDados();
        }
        Comandos.alert(mensagem);
    }

    /** Permite a alteração do nome registrado na marca, validando se o novo
     *  name está em uso, se a marca está de fato cadastrada e se o novo nome
     *  está em branco, após isso insere a retira o resgistro com o nome antigo
     *  e adiciona o com o registro novo no hashmap e usa o método set para 
     *  alterar o nome no objeto em si.
     */
    @Override
    public void alterarMarca(String nome) {
        String novoNome = Comandos.prompt("Digite o novo nome:");
        if (!novoNome.isBlank()) {
            Marca marca = marcas.get(nome.toLowerCase());
            if (marcas.containsKey(nome.toLowerCase())){
                if (!marcas.containsKey(novoNome.toLowerCase())){
                    marca.setNome(novoNome);
                    marcas.put(novoNome.toLowerCase(), marca);
                    marcas.remove(nome.toLowerCase());
                } else {
                    throw new IllegalArgumentException("Este novo nome já está em uso.");
                }
            } else {
                throw new IllegalArgumentException("Esta marca não existe");
            }
        } else {
            throw new IllegalArgumentException("O nome não pode estar em branco.");
        }
    }

    /** Após as devidas validações, exclui a marca do hashmap 
     */
    @Override
    public void removerMarca(String nome) {
        if (this.marcas.containsKey(nome.toLowerCase())){
            Marca marca = this.marcas.get(nome.toLowerCase());
            if (marca.getProdutos().size() == 0) {
                marcas.remove(nome.toLowerCase());
            } else {
                throw new IllegalArgumentException("Ainda há produtos vinculados a essa marca.");
            }
        } else {
            throw new IllegalArgumentException("Não existe uma marca com esse nome.");
        }
    }

    @Override
    public void cadastrar(Produto produto) {
        // Polimorfismo
        boolean produtoExiste = this.produtos.containsKey(produto.nome.toLowerCase());
        if (!produtoExiste){
            this.produtos.put(produto.nome.toLowerCase(), produto);
            produto.getMarca().atualizarProdutos(this);
            if (!this.marcas.containsKey(produto.getMarca().getNome().toLowerCase())) {
                this.marcas.put(produto.getMarca().getNome().toLowerCase(), produto.getMarca());
            }
        } else {
            if (produtoExiste) {
                throw new IllegalArgumentException("Este produto já foi cadastrado.");
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

    public void listarProdutos(){
        String mensagem = "Produtos cadastrados: \n";
        int indice = 0;
        for (Produto p : this.produtos.values()) {
            indice++;
            mensagem += "\nProduto " + indice +":\n"
                      + p.retornarDados();
        }
        Comandos.alert(mensagem);
    }

    /**Exibe um menu e interage com o usuário para pegar os novos dados e 
     * substituí-los nos objetos usando os métodos set */
    @Override
    public void alterarProduto(String nome) {
        if (produtos.containsKey(nome.toLowerCase())){
            String mensagem = "Digite o número correspondente a alteração que deseja fazer:\n"
                            + "1 - Alterar descrição.\n"
                            + "2 - Alterar valor.\n"
                            + "3 - Alterar quantidade em estoque.\n";
            String opcao = Comandos.prompt(mensagem).trim();
            Produto produto = produtos.get(nome.toLowerCase());
            switch(opcao) {
                case "1":
                    String novaDesc = Comandos.prompt( 
                        "Digite a nova descrição");
                    produto.setDescricao(novaDesc);
                    break;
                case "2":
                    Float novoValor = Float.parseFloat(Comandos.prompt( 
                        "Digite o novo valor"));
                    produto.setvalor(novoValor);
                    break;
                case "3":
                    int novaQuantidade = Integer.parseInt(Comandos.prompt( 
                    "Digite a nova quantidade:"));
                    produto.setQuantidadeEstoque(novaQuantidade);
                    break;
                default:
                    Comandos.alert("Opçao Inválida.");
                    break;
            }
            produto.getMarca().atualizarProdutos(this);
        } else {
            throw new IllegalArgumentException("Este produto não existe.");
        }
    }

    @Override
    public void removerProduto(String nome) {
        if (this.produtos.containsKey(nome.toLowerCase())){
            Produto produto = this.produtos.get(nome.toLowerCase());
            Marca marca = produto.getMarca();
            this.produtos.remove(nome.toLowerCase());
            marca.atualizarProdutos(this);
        } else {
            throw new IllegalArgumentException("Não existe um produto com esse nome.");
        }
    }

    /**A partir de um termo inserido como argumento irá pecorrer os registros
     * do hashmap e vê se algum nome contém o termo do argumetno */
    @Override
    public void pesquisarProduto(String termo) {
        String mensagem = "Produto(s) encontrados: \n";
        int indice = 0;
        for (Produto p : produtos.values()) {
            if (p.getNome().toLowerCase().contains(termo.toLowerCase().trim())) {
                indice++;
                mensagem += "\n" + indice + ") \n"
                         +  p.retornarDados();
            }
        }
        Comandos.alert(mensagem);
    }

    /**Percorre os produtos cadastrados procurando por um que tenha a marca 
     * informada no argumento, caso encontre irá exibir os dados do produto. */
    public void pesquisarProdutoMarca(String nomeMarca) {
        if (this.marcas.containsKey(nomeMarca)) {
            Marca marca = marcas.get(nomeMarca);
            int indice = 0;
            String mensagem = "\n" + marca.getProdutos().size() 
                            + " produtos pertencem a essa marca: \n";
            for (Produto p : this.produtos.values()) {
                if(p.getMarca().getNome().equals(marca.getNome())) {
                    indice++;
                    mensagem += "Resultado " + indice +":\n"
                              + p.retornarDados();
                }
            }
            Comandos.alert(mensagem);
        } else {
            throw new IllegalArgumentException("Marca inexistente.");
        }
    }

    public HashMap<String, Produto> getProdutos() {
        return this.produtos;
    }

    // Método main que serve apenas para testes, o sistema não possui interface com o usuário.
    public static void main(String[] args) {
        boolean repetir = true;
        Principal principal = new Principal();
        do {
            try {
                switch (Comandos.menuGeral()) {
                    case 1:
                        try {
                            Comandos.switchMarca(principal);
                        } catch (Exception e) {
                            Comandos.alert(e.toString());
                        }
                        break;
                    case 2:
                        try {
                            Comandos.switchProduto(principal);
                        } catch (Exception e) {
                            Comandos.alert(e.toString());
                        }
                        break;
                    case 3:
                        try {
                            Comandos.switchPesquisa(principal);
                        } catch (Exception e) {
                            Comandos.alert(e.toString());
                        }
                        break;
                    case 4:
                        repetir = false;
                        break;
                    default:
                        throw new Exception("Opção Inválida.");
                }
            } catch (Exception e) {
                Comandos.alert(e.toString());
            }
        } while (repetir == true);
    }
}