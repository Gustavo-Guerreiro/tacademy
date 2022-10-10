package exercicio08;

import java.util.ArrayList;

public class Professor extends Usuario {
    String especialidade;
    ArrayList<Turma> turmas = new ArrayList<>();

    public Professor(String email, String senha, String nome, String especialidade){
        super(email, senha, nome, 'p');
        this.especialidade = especialidade;
    }

    public String getEspecialidade() {
        return this.especialidade;
    }

    public void setEspecialidade(String especialidade) {
        this.especialidade = especialidade;
    }

    public void addTurma(Turma turma){
        this.turmas.add(turma);
    }

    public void removeTurma(Turma turma){
        this.turmas.remove(turma);
    }

    public void cadastrarAvaliacao(Avaliacao avaliacao, Turma turma) {
        turma.addAvaliacao(avaliacao);
    }

    public void excluirAvaliacao(Avaliacao avaliacao, Turma turma) {
        turma.getAvaliacoes().remove(avaliacao);
    }

    public void listarAvaliacoes(Turma turma){
        String mensagem = "================\n";
        for (Avaliacao a : turma.getAvaliacoes()) {
            mensagem += "Assunto: " + a.getAssunto() + "\n"
                      + "Turma: " + turma.getCodigo() + "\n"
                      + "Data: " + a.getData().getDayOfMonth() 
                                 + "/" + a.getData().getMonthValue() + "\n"
                      + "================\n";
        }
        Utilidades.alert(mensagem);
    }

    public void cadastrarNota(Avaliacao a){
        ArrayList<Aluno> alunos = a.getTurma().getAlunos();
        for (Aluno aluno : alunos) {
            float nota = Float.parseFloat( Utilidades.prompt("Digite a nota de " + aluno.getNome()));
            a.getNotas().put(aluno, nota);
        }
    }

    public void alterarNota(Avaliacao avaliacao, Aluno aluno){
        float nota = Float.parseFloat( Utilidades.prompt("Digite a nova nota de " + aluno.getNome()));
        avaliacao.getNotas().put(aluno, nota);
    }

    public void alterarSenhaAluno(String senha, Aluno aluno){
       aluno.setSenha(senha);
    }

}