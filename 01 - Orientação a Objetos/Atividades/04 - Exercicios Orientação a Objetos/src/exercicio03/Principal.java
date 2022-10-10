package exercicio03;

public class Principal {
    public static void main(String[] args) {
        Data d1 = new Data("02/10/2022");
        Data d2 = new Data("01/12/2022");
        Data d3 = new Data("01/01/2023");
        Data d4 = new Data("01/03/2022");
        Data d5 = new Data("01/03/2020");

        System.out.println( d1.getDiaAnterior() );
        System.out.println( d2.getDiaAnterior() );
        System.out.println( d3.getDiaAnterior() );
        System.out.println( d4.getDiaAnterior() );
        System.out.println( d5.getDiaAnterior() );
    }
}