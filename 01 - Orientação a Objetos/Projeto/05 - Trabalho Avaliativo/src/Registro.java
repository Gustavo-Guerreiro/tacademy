import java.time.LocalDate;

import javax.swing.JOptionPane;
/** Classe que representa um registro, nesse caso,
 * ou de produto ou de marca, contém os métodos e atributos
 * que podem pertencer a ambos os objetos. 
 * <p>Possue como atributos:</p>
 * <ul>
 * <li>Nome (String): representa o nome da marca ou produto em questão. </li>
 * <li>dataCadastro (LocalDate): representa o dia em que aquele registro foi 
 * cadastrado. </li>
 * </ul>
 */
public class Registro  {
    protected String nome;
    protected LocalDate dataCadastro;

    public void exibirNome() {
        if (!this.getNome().isBlank()){
            JOptionPane.showConfirmDialog(null,
                "O nome deste registro é: " + this.getNome());
        }
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        if (!nome.isBlank()) {
            this.nome = nome;
        } else {
            throw new IllegalArgumentException("O nome não pode estar vazio");
        }
    }

    public LocalDate getDataCadastro() {
        return this.dataCadastro;
    }

    protected void setDataCadastro(LocalDate dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    /** Exibe uma breve descrição sobre o que classe Registro presenta e faz 
     */
    public static void sobre() {
        String mensagem = "O sistema permite o cadastro de dois elementos:\n"
                        + "- Marca: registra uma marca com um nome próprio e único.\n"
                        + "- Produto: pode ser registrado a partir de uma marca";
        JOptionPane.showMessageDialog(null, mensagem);
    }
}