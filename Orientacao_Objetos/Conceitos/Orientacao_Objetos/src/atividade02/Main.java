package atividade02;

public class Main {

	public static void main(String[] args) {
		
		String verbo = "andar";
		
		if (verbo.endsWith("ar")) {
			
			String inicio= "";
			
			for(int i=0; i<verbo.length()-2; i++) {
				inicio += verbo.charAt(i);
			}
			
			System.out.println("EU "+inicio+"o");
			System.out.println("TU "+inicio+"as");
			System.out.println("ELE "+inicio+"a");
			System.out.println("NOS "+inicio+"amos");
			System.out.println("VOS "+inicio+"ais");
			System.out.println("ELES "+inicio+"am");

		} else {
			System.out.println("A palavra informada não é um verbo");
		}
		
		
		String palavra = "charmander"; 
		int contador = 0;
		
		for(int i = 0; i < palavra.length(); i++) {
			
			if (palavra.charAt(i) == 'a' || palavra.charAt(i) == 'e' || palavra.charAt(i) == 'i' ||palavra.charAt(i) == 'o' || palavra.charAt(i) == 'u') {
				contador = contador + 1;
			}
		}
		
		System.out.println(contador);

	}
	
}
