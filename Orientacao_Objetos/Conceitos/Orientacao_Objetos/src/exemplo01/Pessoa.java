package exemplo01;

import javax.swing.JOptionPane;

public class Pessoa {
	
	String nome;
	int idade;
	double altura;
	
	void obterDados() {
		 nome = JOptionPane.showInputDialog("Informe seu nome");
		 idade = Integer.parseInt(JOptionPane.showInputDialog("Informe sua idade"));
		 altura = Double.parseDouble(JOptionPane.showInputDialog("Informe sua altura"));
	}
	
	void retornarDados() {
		String mensagem = "Nome: " + nome;
			   mensagem+= "\nIdade: " + idade;
			   mensagem+= "\nAltura: " + altura;
			   
		JOptionPane.showMessageDialog(null, mensagem);
	}
	
}
