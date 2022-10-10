import javax.swing.JOptionPane;

/** Apresenta diversos comandos de interação com o usuário, como caixas de 
 * mensagem, caixas com campos de texto, menus com opções, etc. É composto em 
 * três partes principais:
 * <ul>
 * <li>Caixas pop-up para se comunicar/interagir com o usuário</li>
 * <li>Menus interativos que retornam o valor inserido pelo usuário</li>
 * <li>Switches que irão fazer ações dependo do input do usuário nos menus</li>
 * </ul>
*/
public class Comandos {

    // Caixas pop-up para interagir com o usuário.

    /** Irá gerar uma caixa de texto com a mensagem inserida como argumento.
     * Foi baseado no alert do JavaScript.
     */
    public static void alert(String mensagem){
        JOptionPane.showMessageDialog(null, mensagem);
    }

    /** Irá gerar uma caixa com um campo para o usuário poder inserir texto no
     * programa. Baseado no prompt do Javascript*/
    public static String prompt(String mensagem) {
        return JOptionPane.showInputDialog(null, mensagem);
    }

    // Menus as opções.

    public static int menuGeral() {
        String mensagem = "Opções: \n"
                        + "1 - Gerenciar Marcas.\n"
                        + "2 - Gerenciar Produtos.\n"
                        + "3 - Pesquisar Produtos.\n"
                        + "4 - Sair.";
        try {
            int opcao = Integer.parseInt(Comandos.prompt(mensagem));
            if (opcao> 0 && opcao<5) {
                return opcao;
            } else {
                throw new Exception("Opção Inválida.");
            }
        } catch (Exception e) {
            return 4;
        }
    }

    public static int menuMarcas() throws Exception {
        String mensagem = "Opções: \n"
                        + "1 - Cadastrar Marca.\n"
                        + "2 - Alterar Marca.\n"
                        + "3 - Consultar Marca.\n"
                        + "4 - Remover Marca.\n"
                        + "5 - Listar Marcas.\n"
                        + "6 - Voltar.";
        try {
            int opcao = Integer.parseInt(Comandos.prompt(mensagem));
            if (opcao> 0 && opcao<7) {
                return opcao;
            } else {
                throw new Exception("Opção Inválida.");
            }
        } catch (Exception e) {
            return 6;
        }
        
    }

    public static int menuProduto() throws Exception {
        String mensagem = "Opções: \n"
                        + "1 - Cadastrar Produto.\n"
                        + "2 - Alterar Produto.\n"
                        + "3 - Consultar Produto.\n"
                        + "4 - Remover Produto.\n"
                        + "5 - Listar Produtos.\n"
                        + "6 - Voltar.";
        try {
            int opcao = Integer.parseInt(Comandos.prompt(mensagem));
            if (opcao> 0 && opcao<7) {
                return opcao;
            } else {
                throw new Exception("Opção Inválida.");
            }
        } catch (Exception e) {
            return 6;
        }
    }

    public static int menuPesquisa() throws Exception {
        String mensagem = "Opções: \n"
                        + "1 - Pesquisar por Termo. \n"
                        + "2 - Pesquisar por Marca \n"
                        + "3 - Voltar.";
        try {
            int opcao = Integer.parseInt(Comandos.prompt(mensagem));
            if (opcao> 0 && opcao<4) {
                return opcao;
            } else {
                throw new Exception("Opção Inválida.");
            }
        } catch (Exception e) {
            return 3;
        }
    }

    // Switches par fazer as ações pedidas no menu.

    public static void switchMarca(Principal principal) throws Exception {
        String nome;
        switch (menuMarcas()) {
            case 1:
                try {
                    nome = prompt("Digite o nome da marca a ser cadastrada:");
                    Marca m = new Marca(nome);
                    principal.cadastrar(m);
                    alert("Marca cadastrada com sucesso!");
                } catch(Exception e) {
                    alert("Marca não cadastrada.");
                }
                break;
            case 2:
                try{
                    nome = prompt("Digite o nome da marca a ser alterada:");
                    principal.alterarMarca(nome);
                    alert("Marca alterada com sucesso!");
                } catch(Exception e) {
                    alert("Marca não alterada.");
                }
                break;
            case 3:
                try{
                    nome = prompt("Digite o nome da marca a ser consultada:");
                    alert(principal.selecionarMarca(nome).retornarDados());
                } catch(Exception e) {
                    alert("Consulta não realizada.");
                }
                break;
            case 4:
                try{
                    nome = prompt("Digite o nome da marca a ser removida:");
                    principal.removerMarca(nome);
                    alert("Marca removido com sucesso.");
                } catch(Exception e) {
                    alert("Marca não removida.");
                }
                break;
            case 5:
                principal.listarMarcas();
                break;
            case 6:
                break;
            default:
                throw new Exception("Opção Inválida");
        }
    }
    
    public static void switchProduto(Principal principal) throws Exception {
        String nome;
        switch(menuProduto()) {
            case 1:
                try{
                    nome = prompt("Digite o nome do novo produto:");
                    String desc = prompt("Digite a descrição do produto:");
                    float valor = Float.parseFloat(prompt("Digite o valor:"));
                    int qtd = Integer.parseInt(prompt("Digite a quantidade:"));
                    Marca m = principal.selecionarMarca(prompt(
                        "Digite o nome da marca:").toLowerCase());
                    Produto p = new Produto(nome, desc, valor, qtd, m);
                    principal.cadastrar(p);
                    alert("Produto cadastrado com sucesso.");
                } catch(Exception e) {
                    alert("Produto não cadastrado.");
                }
                break;
            case 2:
                try{
                    nome = prompt("Digite o nome do produto a ser alterado:");
                    principal.alterarProduto(nome);
                    alert("Produto alterado com sucesso.");
                } catch(Exception e) {
                    alert("Produto não alterado.");
                }
                break;
            case 3:
                try{
                    nome = prompt("Digite o nome do produto a ser consultado:");
                    alert(principal.selecionarProduto(nome).retornarDados());
                } catch(Exception e) {
                    alert("Consulta cancelada.");
                }
                break;
            case 4:
                try{
                    nome = prompt("Digite o nome do produto a ser removido:");
                    principal.removerProduto(nome);
                    alert("Produto removido com sucesso.");
                } catch(Exception e) {
                    alert("Produto não removido.");
                }
                break;
            case 5:
                principal.listarProdutos();
                break;
            case 6:
                break;
            default:
                throw new Exception("Opção Inválida.");
        }
    }

    public static void switchPesquisa(Principal principal) throws Exception {
        switch(menuPesquisa()){
            case 1:
                try{
                    String termo = prompt("Digite o termo:");
                    principal.pesquisarProduto(termo);
                } catch(Exception e) {
                    alert("Pesquisa não realizada.");
                }
                break;
            case 2:
                try{
                    String marca = prompt("Digite o nome da marca:");
                    principal.pesquisarProdutoMarca(marca);
                } catch(Exception e) {
                    alert("Pesquisa não realizada.");
                }
                break;
            case 3:
                break;
            default:
                throw new Exception("Opção Inválida");
        };
    }
}