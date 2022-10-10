package exercicio02;

import javax.swing.JOptionPane;

public class Principal {
    public static void main(String[] args) {
        String frase = JOptionPane.showInputDialog("Informe uma frase:").toLowerCase();
        String vogais = "aeiou";
        int contador = 0;

        for (int i = 0; i < frase.length(); i++) {
            if (vogais.contains(String.valueOf(frase.charAt(i)))){
                contador++;
            }
        }

        JOptionPane.showMessageDialog(null, "Quantidade de vogais = "+contador);
    }
}