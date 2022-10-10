package exercicio10;

public class Principal {

    public static void main(String[] args) {
        Candidato candidato1 = new Candidato("Jorge" , 99);
        Candidato candidato2 = new Candidato("Maria" , 98);
        Candidato candidato3 = new Candidato("Joaquim" , 97);
        Candidato candidato4 = new Candidato("Mariana" , 93);
        Urna urna = new Urna();


        urna.addCandidato(candidato1);
        urna.addCandidato(candidato2);
        urna.addCandidato(candidato3);
        urna.addCandidato(candidato4);
        
        int continuar = 0;
        do {
            int opcao = urna.coletarVoto();
            
            if (opcao == candidato1.getNumero()) {
                candidato1.incVoto();
            } else if(opcao == candidato2.getNumero()) {
                candidato2.incVoto();
            } else if(opcao == candidato3.getNumero()) {
                candidato3.incVoto();
            } else if(opcao == candidato4.getNumero()) {
                candidato4.incVoto();
            }
            continuar = JO.confirm("Deseja continuar votando?");
        } while (continuar == 0);

        urna.mostrarGanhadores();
    }
}