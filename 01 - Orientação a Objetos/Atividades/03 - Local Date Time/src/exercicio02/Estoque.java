package exercicio02;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class Estoque {
    ArrayList<Produto> produtos = new ArrayList<>();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");


    public void addProduto(){
        String nome = JOptionPane.showInputDialog(null, "Insira o nome do produto");
        double valor = Double.parseDouble(JOptionPane.showInputDialog(null, "Inisira o valor do produto"));
        int qtd = Integer.parseInt(JOptionPane.showInputDialog(null, "Inisira a quantidade em estoque do produto"));
        Produto p = new Produto(nome, valor, qtd, LocalDateTime.now());
        produtos.add(p);
    }

    public void exibirProdutosCadastrados(){
        System.out.println("========================================");
        for (Produto p : produtos){
            System.out.println("Nome: " + p.getNome());
            System.out.println("Valor: R$" + String.format("%.2f", p.getValor())  );
            System.out.println("Quantidade em estoque: " + p.getQtd());
            System.out.println("Data e Hora: " + p.getTempo().format(formatter) );
            System.out.println("========================================");
        }
    }
}