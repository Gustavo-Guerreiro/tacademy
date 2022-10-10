package exercicio05;

import javax.swing.JOptionPane;

public class Forca {
    private String[] palavrasDefinidas = {
        "BOLA",
        "PEDRA",
        "SAPO",
        "NUVEM",
        "HUMANO",
        "RIO",
        "PINTA",
        "FILA",
        "URNA",
        "PATO"
    };

    public String gerarPalavra() {
        return palavrasDefinidas[ (int) Math.round(Math.random() * 10) ];
    }

    public void iniciarJogo() {
        String nome = JOptionPane.showInputDialog(null, "Insira o seu nome:");
        
        String letrasTentadas = "";
        String palavra = gerarPalavra();
        String letra;
        int acertos = 0;
        int erros = 0;
        int continuar;

        do {
            do {
                letra = JOptionPane.showInputDialog(null, "Insira uma letra:").toUpperCase() ;

                if (palavra.contains(letra) && !letrasTentadas.contains(letra)) {
                    acertos++;
                    JOptionPane.showMessageDialog(null, 
                        "Parabéns! Você acertou.\nAcertos: "+acertos);
                    letrasTentadas += letra;
                } else {
                    if (letrasTentadas.contains(letra.toUpperCase())) {
                        JOptionPane.showMessageDialog(null, "Você já tentou essa letra.");
                    } else {
                        letrasTentadas += letra;
                        erros++;
                        JOptionPane.showMessageDialog(null, 
                            "Você errou :( \nQuantidade de erros: " + erros + "/7");
                    }
                }
            } while (erros < 7 && acertos < palavra.length());

            if (erros == 7){
                JOptionPane.showMessageDialog(null, "Você perdeu.");
            } else {
                JOptionPane.showMessageDialog(null, "Parabéns! "+nome+"\nVocê ganhou!\nA palavra é: "+palavra);
            }

            continuar = JOptionPane.showConfirmDialog(null, "Jogar novamente?");
        } while (continuar == 0);

    }
}