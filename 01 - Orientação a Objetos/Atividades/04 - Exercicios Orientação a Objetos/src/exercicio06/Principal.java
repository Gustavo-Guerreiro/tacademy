package exercicio06;

public class Principal {
    public static void main(String[] args) {
        ArrayNumeros a = new ArrayNumeros();
        for(int i : a.ordenarCrescente()){
            System.out.println(i);
        }
        for(int i : a.ordenarDecrescente()){
            System.out.println(i);
        }
        System.out.println(a.somar());
        System.out.println(a.media());
        for(int i : a.maioresMedia()){
            System.out.println(i);
        }
    }
} 