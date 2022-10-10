package exercicio08;

public class Usuario {
    protected String email;
    protected String senha;
    protected String nome;
    protected char tipo;

    public Usuario(String email, String senha, String nome, char tipo){
        this.email = email;
        this.senha = senha;
        this.nome = nome;
        this.tipo = tipo;
    }

    public String getEmail(){
        return this.email;
    }

    public void setEmail(String email){
        this.email = email;
    }

    public String getNome(){
        return this.nome;
    }

    public void setNome(String nome){
        this.nome = nome;
    }

    public void setSenha(String senha){
        this.senha = senha;
    }

    public void alterarPropriaSenha(String senha){
        this.setSenha(senha);
    }
}