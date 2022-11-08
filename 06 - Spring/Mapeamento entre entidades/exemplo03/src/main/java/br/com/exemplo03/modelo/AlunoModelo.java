package br.com.exemplo03.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "alunos")
public class AlunoModelo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigo;
    private String aluno;

    @ManyToMany
    @JoinTable(
        name = "tabela_auxiliar",
        joinColumns = {
            @JoinColumn(
                name = "codigo_aluno", 
                referencedColumnName = "codigo"
            )
        },
        inverseJoinColumns = {
            @JoinColumn(
                name = "codigo_curso",
                referencedColumnName = "codigo"
            )
        }
    )
    private List<CursoModelo> cursos = new ArrayList<>();

    // Get e Set
    public long getCodigo() {
        return this.codigo;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public String getAluno() {
        return this.aluno;
    }

    public void setAluno(String aluno) {
        this.aluno = aluno;
    }

    public List<CursoModelo> getCursos() {
        return this.cursos;
    }

    public void setCursos(List<CursoModelo> cursos) {
        this.cursos = cursos;
    }


}
