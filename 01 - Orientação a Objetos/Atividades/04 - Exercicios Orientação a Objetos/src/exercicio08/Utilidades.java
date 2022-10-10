package exercicio08;

import javax.swing.JOptionPane;

public class Utilidades {
    public static String prompt(String mensagem) {
        String retorno = JOptionPane.showInputDialog(null, mensagem);
        return retorno;
    }

    public static void alert(String mensagem) {
        JOptionPane.showMessageDialog(null, mensagem);
    }
}