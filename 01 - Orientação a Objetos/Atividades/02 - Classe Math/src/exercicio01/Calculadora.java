package exercicio01;

import javax.swing.JOptionPane;

public class Calculadora {
    static String resultado;
    public static void main(String[] args) {
        double n1 = 0;
        double n2 = 0;
        String opcoes = "1 - Soma \n"
                  + "2 - Subtração \n"
                  + "3 - Multiplicação \n"
                  + "4 - Divisão \n"
                  + "5 - Seno \n"
                  + "6 - Cosseno \n"
                  + "7 - Tangente \n"
                  + "8 - Log \n"
                  + "9 - Raiz Quadrada \n"
                  + "10 - Raiz Cúbica \n";
        int continuar = 0;
        
        while (continuar == 0) {
            String operacao = JOptionPane.showInputDialog(opcoes + "Informe uma operação: ").trim();

            if ("12345678910".contains(operacao)){
                n1 = Double.parseDouble(JOptionPane.showInputDialog("Digite o primeiro número racional: "));
                if ("1234".contains(operacao)) {
                    n2 = Double.parseDouble(JOptionPane.showInputDialog("Digite o segundo número racional: "));
                }
                switch (operacao) {
                    case "1":
                        resultado = String.valueOf(n1 + n2);
                        break;
                    case "2":
                        resultado = String.valueOf(n1 - n2);
                        break;
                    case "3":
                        resultado = String.valueOf(n1 * n2);
                        break;
                    case "4":
                        resultado = String.valueOf(n1 / n2);
                        break;
                    case "5":
                        resultado = String.valueOf( Math.sin(n1) );
                        break;
                    case "6":
                        resultado = String.valueOf( Math.cos(n1) );
                        break;
                    case "7":
                        resultado = String.valueOf( Math.tan(n1) );
                        break;
                    case "8":
                        resultado = String.valueOf( Math.log(n1) );
                        break;
                    case "9":
                        resultado = String.valueOf( Math.sqrt(n1) );
                        break;
                    case "10":
                        resultado = String.valueOf( Math.cbrt(n1) );
                        break;
                }
            } else {
                JOptionPane.showMessageDialog(null, "Opção Inválida");
            }
            JOptionPane.showMessageDialog(null, resultado);
            continuar = JOptionPane.showConfirmDialog(null, "Deseja continuar");
        }
    }
}