package exercicio02;

import java.time.LocalDateTime;

public class Produto {
    private String nome;
    private double valor;
    private int qtd;
    private LocalDateTime tempo;

    public Produto(String nome, double valor, int qtd, LocalDateTime tempo){
        this.nome = nome;
        this.valor = valor;
        this.qtd = qtd;
        this.tempo = tempo;
    }


    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getValor() {
        return this.valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public int getQtd() {
        return this.qtd;
    }

    public void setQtd(int qtd) {
        this.qtd = qtd;
    }

    public LocalDateTime getTempo() {
        return this.tempo;
    }

    public void setTempo(LocalDateTime tempo) {
        this.tempo = tempo;
    }

}