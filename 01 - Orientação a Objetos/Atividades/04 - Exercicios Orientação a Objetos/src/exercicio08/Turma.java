package exercicio08;

import java.util.ArrayList;

public class Turma {
    private ArrayList<Aluno> alunos = new ArrayList<>();
    private String codigo;
    private ArrayList<Avaliacao> avaliacoes = new ArrayList<>();

    public Turma(String codigo){
        this.codigo = codigo;
    }

    public void adicionarAluno(Aluno aluno){
        this.alunos.add(aluno);
        aluno.setTurma(this);
    }

    public String getCodigo() {
        return this.codigo;
    }

    public ArrayList<Aluno> getAlunos() {
        return this.alunos;
    }

    public void addAvaliacao(Avaliacao avaliacao){
        this.avaliacoes.add(avaliacao);
    }

    public String consultarAvaliacao(Aluno aluno){
        String consulta = "========================\n";
        for (Avaliacao a : avaliacoes) {
            float nota = a.getNotas().get(aluno);
            consulta += "Assunto: " + a.getAssunto() + "\n"
                      + "Turma: " + this.getCodigo() + "\n"
                      + "Data: " + a.getData().getDayOfMonth() 
                                 + "/" + a.getData().getMonthValue() + "\n"
                      + "Nota: " + nota + "\n"
                      + "========================\n";
        }
        return consulta;
    }

    public ArrayList<Avaliacao> getAvaliacoes() {
        return this.avaliacoes;
    }
}