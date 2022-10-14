package exerciciosPOO;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {

		boolean continuar = true;

		while (continuar) {
			System.out.println("Selecione a opcao que deseja realizar: \n");
			System.out.println("1 - Cadastrar\n2 - Listar \n3 - Pesquisar \n4 - Alterar \n5 - Remover \n6 - Sair");

			Scanner scan = new Scanner(System.in);

			AcoesContato ac = new AcoesContato();
			int opcao = scan.nextInt();
			
			switch (opcao) {
			case 1:
				ac.cadastrar();
				break;
			case 2:
				ac.listar();
				break;
			case 3:
				ac.pesquisar();
				break;
			case 4:
				ac.alterar();
				break;
			case 5:
				ac.remover();
				break;
			case 6:
				System.out.println("Deseja sair?");
				String resposta = scan.next();
				if (resposta.equals(resposta)) {
					continuar = false;
				}
			}
		}
	}
}
