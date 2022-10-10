package exercicio02;

import javax.swing.JOptionPane;

public class Principal {
    public static void main(String[] args) {
        int maximo = 100;
        double aleatorio = Math.random();
        int numero = (int) Math.round(aleatorio * maximo);
        int chute;
        int palpites = 0;

        do {
            chute = Integer.parseInt(JOptionPane.showInputDialog(null, "Chute um número"));
            palpites++;
            int diferenca = Math.abs(numero - chute);

            if (diferenca <= 10) {
                JOptionPane.showMessageDialog(null, "Está perto.");
            } else if (diferenca <= 20) {
                JOptionPane.showMessageDialog(null, "Está longe.");
            } else if (diferenca > 20){
                JOptionPane.showMessageDialog(null, "Muito longe.");
            }

        } while (chute != numero);

        if(palpites == 1) {
            JOptionPane.showMessageDialog(null, "Nossa! Acertou na mosca");
        } else if (palpites <= 5) {
            JOptionPane.showMessageDialog(null, "Parabéns! Você é bom de adivinhação");
        } else if (palpites <= 10) {
            JOptionPane.showMessageDialog(null, "Muito bom, continue assim");
        } else if (palpites <= 20) {
            JOptionPane.showMessageDialog(null, "Podia ser melhor, continue tentando");
        } else {
            JOptionPane.showMessageDialog(null, "Meio lerdo você, hein?");
        }
    }
}