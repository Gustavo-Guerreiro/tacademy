package exercicio03;

import javax.swing.JOptionPane;

public class Principal {
    public static void main(String[] args) {
        String verbo = JOptionPane.showInputDialog("Informe um verbo terminado em AR:").toUpperCase().trim();
        
        String[] pronomes = {"EU", "TU", "ELE", "NÓS", "VÓS", "ELES"};
        String[] sufixos = {"O", "AS", "A", "AMOS", "ÁIS", "AM"};

        String mensagem = "A conjugação do verbo " + verbo + " é: \n\n";

        if (!verbo.endsWith("AR")) {
            JOptionPane.showMessageDialog(null, "Não é um verbo terminado em 'ar'!");
        } else {
            for (int i = 0; i < pronomes.length; i++) {
                mensagem += pronomes[i] + " " + verbo.replace("AR", sufixos[i]);
                if (i != pronomes.length - 1){
                    mensagem += "\n";
                }
            }
            JOptionPane.showMessageDialog(null, mensagem);
        }

    }
}