package exercicio07;

import java.util.concurrent.ThreadLocalRandom;

import javax.swing.JOptionPane;

public class Tabuleiro {
    private char[][] tabuleiro = new char[10][10];

    public void povoarTabuleiro(){
        int[] linha = ThreadLocalRandom.current().ints(0, 10)
                                        .distinct().limit(4).toArray();
        int[] coluna = ThreadLocalRandom.current().ints(0, 10)
                                        .distinct().limit(4).toArray();
        for (int i = 0; i < 4; i++) {
            if(i == 0) {
                this.tabuleiro[linha[i]][coluna[i]] = 'N';
                System.out.println(linha[i] +", " + coluna[i]);
            } else {
                this.tabuleiro[linha[i]][coluna[i]] = 'B';
                System.out.println(linha[i] +", " + coluna[i]);
            }
            
        }
    }

    public void iniciarJogo(){
        this.povoarTabuleiro();

        int bombas = 0;
        int navios = 0;
        
        do {
            String[] coordenada = JOptionPane.showInputDialog(null, "Digite um par ordenado separado por espaço:").split(" ");

            int x = Integer.parseInt(coordenada[0]);
            int y = Integer.parseInt(coordenada[1]);

            char alvo = this.tabuleiro[x][y];

            if (alvo == 'N') {
                navios++;
                JOptionPane.showMessageDialog(null, "Acertou um navio!");
            }
            if (alvo == 'B') {
                bombas++;
                JOptionPane.showMessageDialog(null, "Acertou uma bomba!\nBombas acertadas: " + bombas+"/3");
            }

        } while (bombas < 3 && navios < 1);

        JOptionPane.showMessageDialog(null, "Fim de Jogo");
    }
    
}