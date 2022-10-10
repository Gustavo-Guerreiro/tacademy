import java.time.LocalDate;

import javax.swing.JOptionPane;

/** Classe que representa um produto a ser registrado em uma loja. 
 * <p>Possue como atributos:</p>
 * <ul>
 * <li>produtos (HashMap<String, Produto>): é uma lista dos produtos que aquela marca possui. </li>
 * </ul>
 */
public class Marca extends Registro{

    public Marca(String nome){
        setNome(nome);
        setDataCadastro(LocalDate.now());
    }

    public void exibirNome() {
        if (!this.getNome().isBlank()){
            JOptionPane.showConfirmDialog(null,
                "O nome deste marca é: " + this.getNome());
        }
    }

    /** Exibe uma breve descrição sobre o que classe Marca presenta e faz 
     */
    public static void sobre() {
        String mensagem = "As categorias orbigatoriamente devem ser cadastrados com um nome único. \n"
                        + "Aqui serão incluidos os produtos que pertencem a essa marca.";
        JOptionPane.showMessageDialog(null, mensagem);
    }
}