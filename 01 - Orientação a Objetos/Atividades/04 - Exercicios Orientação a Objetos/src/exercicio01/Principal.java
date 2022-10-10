package exercicio01;

public class Principal {
    public static void main(String[] args) {
        Agenda a = new Agenda();
        a.cadastrar("Gustavo", "email1@email.com", "99999-9999");
        a.cadastrar("Marcos", "email2@email.com", "99999-7777");
        a.cadastrar("José", "email3@email.com", "88888-9999");
        a.cadastrar("Gustavo", "email1@email.com", "99999-9999");

        a.listar();

        a.pesquisar("Marcos");

        a.alterar();

        a.remover();

        a.listar();
    }
}