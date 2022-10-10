package exercicio06;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

import javax.swing.JOptionPane;

public class ArrayNumeros {
    private Integer[] vetor = new Integer[5];

    public ArrayNumeros(){
        for (int i = 0; i < 5; i++) {
            int numero = Integer.parseInt(JOptionPane.showInputDialog(null, "Digite um número:"));
            vetor[i] = numero;
        }
    }

    public Integer[] ordenarCrescente(){
        Integer[] novoVetor = this.vetor.clone();
        Arrays.sort(novoVetor);
        return novoVetor;
    }

    public Integer[] ordenarDecrescente(){
        Integer[] novoVetor = this.vetor.clone();
        Arrays.sort(novoVetor, Collections.reverseOrder());
        return novoVetor;
    }

    public int somar(){
        int soma = 0;
        for (Integer integer : vetor) {
            soma += integer;
        }
        return soma;
    }

    public double media(){
        return (double) this.somar() / 5.0;
    }

    public Integer[] maioresMedia() {
        ArrayList<Integer> maioresMedia = new ArrayList<>();
        for (Integer integer : vetor) {
            if(integer >= this.media()){
                maioresMedia.add(integer);
            }
        }
        Integer[] valores = new Integer[maioresMedia.size()];
        maioresMedia.toArray(valores);
        return valores;
    }
}