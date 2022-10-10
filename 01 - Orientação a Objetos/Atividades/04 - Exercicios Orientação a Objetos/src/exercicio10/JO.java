package exercicio10;

import javax.swing.JOptionPane;

public class JO {
    public static void alert(String mensagem){
        JOptionPane.showMessageDialog(null, mensagem);
    }

    public static String prompt(String mensagem) {
        return JOptionPane.showInputDialog(null, mensagem);
    }
    
    public static int confirm(String mensagem) {
        return JOptionPane.showConfirmDialog(null, mensagem);
    }
}