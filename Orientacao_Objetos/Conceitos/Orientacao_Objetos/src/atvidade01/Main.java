package atvidade01;

public class Main {

	public static void main(String[] args) {
		
		String palavra = "proway";
//		String vetor[] = palavra.split("");
//		
//		System.out.println(vetor[0]);
//		System.out.println(vetor[1]);
//		System.out.println(vetor[2]);
//		System.out.println(vetor[3]);
//		System.out.println(vetor[4]);
//		System.out.println(vetor[5]);
		
		for(int i = 0; i < palavra.length(); i++) {
			String letra = String.valueOf(palavra.charAt(i));
			
			if(i % 2 == 0) {
				System.out.print(letra.toUpperCase());
			} else {
				System.out.print(letra.toLowerCase());
			}
		}
	}

}
