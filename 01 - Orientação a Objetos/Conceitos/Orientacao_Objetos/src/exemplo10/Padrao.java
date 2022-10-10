package exemplo10;

public class Padrao {

	// Vale transporte
	public void valeTransporte(double salario) {
		System.out.println("Vale Transporte: R$ " + (salario * 0.06));
	}
	
	// Vale alimentação
	public void valeAlimentacao(double salario) {
		System.out.println("Vale Alimentação: R$ " + (salario * 0.1));
	}

}
