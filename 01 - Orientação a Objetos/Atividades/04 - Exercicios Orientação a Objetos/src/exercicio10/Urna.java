package exercicio10;

import java.util.ArrayList;
import java.util.HashMap;

public class Urna {
    HashMap<Integer, Candidato> candidatos = new HashMap<>();
    int totalVotos = 0;

    public int coletarVoto() {
        String mensagem = "";

        for (Candidato c : candidatos.values()) {
            mensagem += c.getDados() + "\n";
        }
        mensagem += "Qualquer outro número - nulo\n";
        mensagem += "Escolha o seu candidato:";
        
        int voto = Integer.parseInt(JO.prompt(mensagem));

        if (candidatos.containsKey(voto)) {
            this.totalVotos++;
        }
        return voto;
    }

    public void addCandidato(Candidato candidato) {
        if (candidato!= null) {
            candidatos.put(candidato.getNumero(), candidato);
        } else {
            throw new IllegalArgumentException("Candidato não pode ser nulo.");
        }
    }

    public Candidato retornarMaisVotado() {
        int maisVotos = Integer.MIN_VALUE;
        Candidato maisVotado = null;
        for (Candidato c : candidatos.values()) {
            if (c.getVotos() > maisVotos) {
                maisVotos = c.getVotos();
                maisVotado = c;
            }
        }
        return maisVotado;
    }

    public ArrayList<Candidato> getGanhadores() {
        Candidato maisVotado = retornarMaisVotado();
        ArrayList<Candidato> empatados = new ArrayList<>();
        for (Candidato c : candidatos.values()) {
            if (c.getVotos() == maisVotado.getVotos()){
                empatados.add(c);
            }
        }
        return empatados;
    }

    public void mostrarGanhadores() {
        if (getGanhadores().size() > 1) {
            String mensagem = "Houve empate entre: \n";
            for (Candidato c : getGanhadores()) {
                mensagem += c.getNome() + " - " 
                         + (c.getVotos()*100)/this.totalVotos + "%\n";
            }
            JO.alert(mensagem);
        } else {
            Candidato ganhador = getGanhadores().get(0);
            JO.alert("O ganhador foi " + ganhador.getNome() 
                    + " - " + (ganhador.getVotos()*100)/totalVotos + "%");
        }
    }

}