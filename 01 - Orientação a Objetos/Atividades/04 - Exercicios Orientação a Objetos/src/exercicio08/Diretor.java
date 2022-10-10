package exercicio08;

import java.util.ArrayList;

public class Diretor extends Usuario {
    private ArrayList<Professor> professores = new ArrayList<>();
    private ArrayList<Aluno> alunos = new ArrayList<>();
    private ArrayList<Turma> turmas = new ArrayList<>();

    public Diretor(String email, String senha, String nome){
        super(email, senha, nome, 'd');
    }

    // Gerenciar professores
    public void cadastrarProfessor(String email, String senha, String nome, String especialidade){
        professores.add(new Professor(email, senha, nome, especialidade));
    }

    public void alterarProfessor(String email){
        for (Professor p : this.professores) {
            if (p.getEmail().equals(email)){
                int opcao = Integer.parseInt(
                    Utilidades.prompt("O que deseja alterar?\n1 - E-mail\n2- Nome\n3 - Especialização"));
                switch (opcao) {
                    case 1:
                        String novoEmail = Utilidades.prompt("Digite o novo e-mail do professor");
                        p.setEmail(novoEmail);
                        break;
                    case 2:
                        String novoNome = Utilidades.prompt("Digite o novo nome do professor:");
                        p.setNome(novoNome);
                        break;
                    case 3:
                        String novaEspecialidade = Utilidades.prompt("Digite a nova especialidade do professor:");
                        p.setEspecialidade(novaEspecialidade);
                        break;
                    default:
                        Utilidades.alert("Opção Inválida");
                }
                return;
            }
        }
        Utilidades.alert("Professor não encontrado");
    }

    public void removerProfessor(String email){
        for (Professor p : this.professores) {
            if (p.getEmail().equals(email)){
                professores.remove(p);
                return;
            }
        }
        System.out.println("Professor não encontrado.");
    }

    public void listarProfessores() {
        String dadosProfessores = "========================\n";
        for (Professor p : this.professores) {
            dadosProfessores += "E-mail: " + p.getEmail() + "\n"
                              + "Nome: " + p.getNome() + "\n"
                              + "Especialidade: " + p.getEspecialidade() + "\n"
                              + "========================\n";
        }
        Utilidades.alert(dadosProfessores);
    }

    // Gerenciar alunos
    public void cadastrarAluno(String email, String senha, String nome){
        alunos.add(new Aluno(email, senha, nome));
    }

    public void alterarAluno(String email) {
        for (Aluno a : this.alunos) {
            if (a.getEmail().equals(email)){
                int opcao = Integer.parseInt(
                    Utilidades.prompt("O que deseja alterar?\n1 - E-mail\n2- Nome"));
                switch (opcao) {
                    case 1:
                        String novoEmail = Utilidades.prompt("Digite o novo e-mail do aluno");
                        a.setEmail(novoEmail);
                        break;
                    case 2:
                        String novoNome = Utilidades.prompt("Digite o novo nome do aluno:");
                        a.setNome(novoNome);
                        break;
                    default:
                        Utilidades.alert("Opção Inválida");
                }
                return;
            }
        }
        Utilidades.alert("Aluno não encontrado");
    }

    public void removerAlunos(String email) {
        for (Aluno a : this.alunos) {
            if (a.getEmail().equals(email)){
                alunos.remove(a);
                return;
            }
        }
        System.out.println("Aluno não encontrado.");
    }

    public void listarAlunos() {
        String dadosAlunos = "========================\n";
        for (Aluno a : this.alunos) {
            dadosAlunos += "E-mail: " + a.getEmail() + "\n"
                        + "Nome: " + a.getNome() + "\n"
                        + "Turma: " + a.getTurma().getCodigo() + "\n"
                        + "========================\n";
        }
        Utilidades.alert(dadosAlunos);
    }

    // Gerenciar turmas
    public void cadastrarTurma(String codigo){
        this.turmas.add(new Turma(codigo));
    }

    public void removerTurma(Turma turma){
        if (turma.getAlunos().size() == 0){
            turmas.remove(turma);
        }
    }

    public void listarTurmas() {
        String mensagem = "================\n";
        for (Turma t : turmas) {
            mensagem += "Codigo: " + t.getCodigo() + "\n" 
                      + "Alunos: ";
            for(Aluno a : t.getAlunos()){
                mensagem += "   " + a.getNome();
            }
            mensagem += "================\n";
        }
        Utilidades.alert(mensagem);
    }

    // Estatisticas
    public void estatisticas() {
        String estatisticas = "Quantidade de Professores: " + professores.size()
                            + "Quantidade de Alunos: " + alunos.size()
                            + "Quantidade de Turmas: " + turmas.size();
        Utilidades.alert(estatisticas);
    }

    // Alterar Senhas
    public void alterarSenhaAluno(String email, String senha){
        for (Aluno a : this.alunos) {
            if (a.getEmail() == email){
                a.setSenha(senha);
            }
        }
    }

    public void alterarSenhaProfessor(String email, String senha){
        for (Professor p : this.professores) {
            if (p.getEmail() == email){
                p.setSenha(senha);
            }
        }
    }

}