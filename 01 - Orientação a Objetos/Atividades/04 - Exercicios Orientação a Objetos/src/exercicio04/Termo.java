package exercicio04;

public class Termo {
    private String termo;

    public Termo(String termo) {
        this.termo = termo;
    }

    public int contarVogais(){
        String vogais = "aeiouAEIOU";
        int contador = 0;
        for (int i = 0; i < termo.length(); i++) {
            if (vogais.contains( String.valueOf(termo.charAt(i)) )) {
                contador ++;
            }
        }
        return contador;
    }

    public int contarConsoantes(){
        String consoantes = "bcdfghjklmnpqrstvwxyz";
        consoantes += consoantes.toUpperCase();
        int contador = 0;
        for (int i = 0; i < termo.length(); i++) {
            if (consoantes.contains( String.valueOf(termo.charAt(i)) )) {
                contador ++;
            }
        }
        return contador;
    }

    public int contarNumeros() {
        String numeros = "1234567890";
        int contador = 0;
        for (int i = 0; i < termo.length(); i++) {
            if (numeros.contains( String.valueOf(termo.charAt(i)) )) {
                contador ++;
            }
        }
        return contador;
    }

    public int contarEspacos() {
        int contador = 0;
        for (int i = 0; i < termo.length(); i++) {
            if ( termo.charAt(i) == ' ') {
                contador ++;
            }
        }
        return contador;
    }

    public int contarCaracteresEspeciais() {
        String caracteresEspeciais = "!@#$%¨&*()-'[]{}º<>.,;:/+§ª";
        int contador = 0;
        for (int i = 0; i < termo.length(); i++) {
            if (caracteresEspeciais.contains( String.valueOf(termo.charAt(i)) )) {
                contador ++;
            }
        }
        return contador;
    }
}