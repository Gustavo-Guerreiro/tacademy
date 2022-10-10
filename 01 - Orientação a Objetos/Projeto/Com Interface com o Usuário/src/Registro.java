import java.time.LocalDate;

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

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        // valida se o nome está em branco
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

    // vai retornar uma String contendo a descrição do nome e data do registro.
    public String retornarDados() {
        String mensagem = "Nome: " + this.getNome() + "\n"
                        + "Data Cadastro: " +this.dataCadastro.toString() +"\n";
        return mensagem;
    }
}