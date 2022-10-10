package exemplo04;

public class Calculos {
	
	// Atributo contador
	private static int contador = 0;
	
	// Construtor
	public Calculos() {
		contador++;
		System.out.println(contador);
	}

	// Método de soma
	public static void soma(int n1, int n2) {
		System.out.println(n1 + n2);
	}

}
