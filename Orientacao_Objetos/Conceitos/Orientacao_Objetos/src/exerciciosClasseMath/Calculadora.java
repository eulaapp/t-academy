package exerciciosClasseMath;
import java.lang.Math;
import java.util.Scanner;

public class Calculadora {
	
	public void calcular() {
		System.out.println("1 - somar, 2 - subtrair, 3 - multiplicar, 4 - divisao, 5 - seno, 6 - cosseno, 7 - tangente, 8 - log, 9 - raiz quadrada, 10 - raiz cubica");
		
		Scanner scan = new Scanner(System.in);
		int opcao = scan.nextInt();
		
		switch (opcao) {
		case 1: 
			System.out.println("Digite o primeiro valor: ");
			double numero1 = scan.nextDouble();
			
			System.out.println("Digite o segundo valor: ");
			double numero2 = scan.nextDouble();
			
			System.out.println(numero1+numero2);
			break;
			
		case 2: 
			System.out.println("Digite o primeiro valor: ");
			double n1 = scan.nextDouble();
			
			System.out.println("Digite o segundo valor: ");
			double n2 = scan.nextDouble();
			
			System.out.println(n1-n2);
			break;
			
		case 3: 
			System.out.println("Digite o primeiro valor: ");
			double num1 = scan.nextDouble();
			
			System.out.println("Digite o segundo valor: ");
			double num2 = scan.nextDouble();
			
			System.out.println(num1*num2);
			break;
			
		case 4: 
			System.out.println("Digite o primeiro valor: ");
			double primeiroValor = scan.nextDouble();
			
			System.out.println("Digite o segundo valor: ");
			double segundoValor = scan.nextDouble();
			
			System.out.println(primeiroValor/segundoValor);
			break;
		case 5:
			System.out.println("Digite o primeiro valor: ");
			double seno = scan.nextDouble();
			
			
			System.out.println(Math.sin(seno));
			
			break;
		case 6: 
			System.out.println("Digite o primeiro valor: ");
			double cosseno = scan.nextDouble();
			System.out.println(Math.cos(cosseno));
			break;
			
		case 7:
			System.out.println("Digite o primeiro valor: ");
			double tan = scan.nextDouble();
			System.out.println(Math.tan(tan));
			break;
			
		case 8:
			System.out.println("Digite o primeiro valor: ");
			double log = scan.nextDouble();
			System.out.println(Math.log(log));
			break;
			
		case 9:
			System.out.println("Digite o primeiro valor: ");
			double sqtr = scan.nextDouble();
			System.out.println(Math.sqrt(sqtr));
			break;

		case 10:
			System.out.println("Digite o primeiro valor: ");
			double cbrt = scan.nextDouble();
			System.out.println(Math.cbrt(cbrt));
			break;
		}
	}
}
