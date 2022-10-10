package exercicio01;

import javax.swing.JOptionPane;

public class Principal {
    public static void main(String[] args) {
        String palavra = JOptionPane.showInputDialog("Informe uma palavra:");

        String stringFinal = "";

        for (int i = 0; i < palavra.length(); i++) {
            if (i % 2 == 0) {
                stringFinal += String.valueOf(palavra.charAt(i)).toUpperCase(); 
            } else {
                stringFinal += String.valueOf(palavra.charAt(i)).toLowerCase(); 
            }
        }

        JOptionPane.showMessageDialog(null, stringFinal);

    }

}