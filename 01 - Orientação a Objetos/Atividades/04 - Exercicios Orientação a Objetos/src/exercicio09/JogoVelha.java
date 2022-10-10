package exercicio09;

public class JogoVelha {
    char[][] tabuleiro = new char[3][3];

    public int conferirLinhas(){
        int ganhador = 0;
        for (int i = 0; i < 3; i++) {
            if ('X' == tabuleiro[i][0] && tabuleiro[i][0] == tabuleiro[i][1] && tabuleiro[i][1] == tabuleiro[i][2]){
                ganhador = 1;
            } else if ('O' == tabuleiro[i][0] && tabuleiro[i][0] == tabuleiro[i][1] && tabuleiro[i][1] == tabuleiro[i][2]) {
                ganhador = 2;
            }
        }
        return ganhador;
    }

    public boolean conferirColunas
}