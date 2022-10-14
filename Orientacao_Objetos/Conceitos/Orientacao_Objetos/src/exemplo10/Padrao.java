package exemplo10;

public class Padrao {
	
	// Vale transporte
	public void valeTransporte(double salario) {
		System.out.println("Vale transporte R$ " + (salario * 0.06));
	}
	
	// Vale alimentação
	public void valeAlimentacao(double salario) {
		System.out.println("Vale alimentação R$ " + (salario * 0.01));
	}
}

