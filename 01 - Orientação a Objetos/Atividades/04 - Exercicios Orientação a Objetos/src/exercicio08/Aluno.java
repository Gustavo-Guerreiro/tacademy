package exercicio08;

public class Aluno extends Usuario {
    private Turma turma;

    public Aluno(String email, String senha, String nome){
        super(email, senha, nome, 'a');
    }

    public void setTurma(Turma turma){
        this.turma = turma;
    }

    public Turma getTurma(){
        return this.turma;
    }

    public void consultarAvaliacoes(){
        this.turma.consultarAvaliacao(this);
    }
}