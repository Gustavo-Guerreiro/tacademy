package exercicio10;

public class Candidato {
    private String nome;
    private int numero;
    private int qtdVotos = 0;

    public Candidato(String nome, int numero) {
        this.nome = nome;
        this.numero = numero;
    }

    public void setNome(String nome) {
        if (!nome.isBlank()){
            this.nome = nome;
        } else {
            throw new IllegalArgumentException("O nome não pode ser nulo.");
        }
    }

    public String getNome() {
        return nome;
    }

    public void setNumero(int numero) {
        if (numero > 0){
            this.numero = numero;
        } else {
            throw new IllegalArgumentException("O número não podde ser negativo");
        }
    }

    public int getNumero() {
        return numero;
    }

    public int getVotos() {
        return this.qtdVotos;
    }

    public void incVoto() {
        this.qtdVotos++;
    }

    public void decVoto(){
        this.qtdVotos--;
    }

    public String getDados() {
        String mensagem = this.getNumero() + " - " + this.getNome();
        return mensagem;
    }
}