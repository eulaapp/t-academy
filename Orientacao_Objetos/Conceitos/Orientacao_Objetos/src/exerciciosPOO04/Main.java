package exerciciosPOO04;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {
		String frase = JOptionPane.showInputDialog("Digite um termo, pode conter letras,"
				+ " números e caracteres");
		
		int quantidadeVogais = 0;
		int quantidadeConsoantes = 0;
		int quantidadeCaracteresEspeciais = 0;
		int quantidadeNumeros = 0;
		int quantidadeEspacos = 0;
		
		String vogais[] = {"a","e","i","o","u"};
		
		
		for (int i = 0; i < frase.length() ; i++) {
			for (int j = 0; j < vogais.length; j ++) {
			
			}
//			if (frase.charAt(i) == 'a' || frase.charAt(i) == 'e' || frase.charAt(i) == 'i' ||frase.charAt(i) == 'o' || frase.charAt(i) == 'u') {
//				vogais = vogais + 1;
//			}
		}
		
		System.out.println("Vogais: " + vogais);
	}

}
