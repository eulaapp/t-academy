package exerciciosClasseMath;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {

//		Calculadora c = new Calculadora();
//		c.calcular();
//		
//		System.out.println("Deseja continuar?");
//		Scanner scan = new Scanner(System.in);
//		
//		boolean continuar = scan.nextBoolean();
//		
//		if (continuar == true) {
//			c.calcular();
//		} else {
//			System.out.println("Desligando");
//		}

		boolean continua = true;
		int tentativas = 0;

		int minimo = 0;
		int maximo = 100;

		double numeroAleatorio = Math.random();
		int numero = (int) Math.round(minimo + numeroAleatorio * maximo);

		System.out.println(numero);

		while (continua) {

			System.out.println("Digite seu palpite: ");
			Scanner scan = new Scanner(System.in);

			int palpite = scan.nextInt();

			if (palpite != numero) {
				if (palpite <= numero + 10 && palpite >= numero - 10) {
					System.out.println("Está perto");
				} else if (palpite < numero + 19 && palpite > numero - 19) {
					System.out.println("Está longe");
				} else {
					System.out.println("Muito longe");
				}

				tentativas = tentativas + 1;

			} else {
				continua = false;

				if (tentativas <= 5) {
					System.out.println("Parabéns! Você é bom de adivinhação");
				} else if (tentativas <= 10) {
					System.out.println("Muito bom, continue assim");
				} else if (tentativas <= 20) {
					System.out.println("Podia ser melhor, continue tentando");
				} else {
					System.out.println("Meio lerdo você, hein");
				}
			}

		}

		System.out.println(tentativas);

	}

}
