package exemplo02;

import javax.swing.JOptionPane;

public class Aluno {
	
	// Atributos
	private String nome;
	private double nota1, nota2;
	
	// Metodo para obter dados do aluno
	private void obterDados() {
		nome = JOptionPane.showInputDialog("Informe o nome");
		nota1 = Double.parseDouble(JOptionPane.showInputDialog("Primeira nota"));
		nota2 = Double.parseDouble(JOptionPane.showInputDialog("Segunda nota"));
	}
	
	//Metodo de media
	private double media() {
		return (nota1 + nota2) / 2;
	}
	
	// Situação
	private String situacao(double media) {
		return media >= 7 ? "aprovado(a)" : "reprovado(a)";
	}
	
	// Método de mensagem
	private void mensagem() {
		JOptionPane.showMessageDialog(null, nome + " obteve a média " + media() + " e está " + situacao(media()));
	}
	
	// Inicia o sistema
	public void iniciar() {
		obterDados();
		mensagem();
	}
}
