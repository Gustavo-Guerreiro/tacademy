package exercicio08;

import java.time.LocalDate;
import java.util.HashMap;

public class Avaliacao {
    private String assunto;
    private Turma turma;
    private LocalDate data;
    private HashMap<Aluno, Float> notas = new HashMap<Aluno, Float>();

    public Avaliacao() {}

    public Avaliacao(String assunto, Turma turma, LocalDate data, HashMap<Aluno,Float> notas) {
        this.assunto = assunto;
        this.turma = turma;
        this.data = data;
        this.notas = notas;
    }

    public String getAssunto() {
        return this.assunto;
    }

    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    public Turma getTurma() {
        return this.turma;
    }

    public void setTurma(Turma turma) {
        this.turma = turma;
    }

    public LocalDate getData() {
        return this.data;
    }

    public void setData(LocalDate data) {
        this.data = data;
    }

    public Float getNotasAluno(Aluno aluno) {
        return this.notas.get(aluno);
    }

    public HashMap<Aluno, Float> getNotas(){
        return this.notas;
    }



}