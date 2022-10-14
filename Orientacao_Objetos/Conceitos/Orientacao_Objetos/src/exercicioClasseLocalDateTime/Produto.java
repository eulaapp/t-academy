package exercicioClasseLocalDateTime;
import java.time.LocalDateTime;

import javax.swing.JOptionPane;


public class Produto {

	String nome;
	double valor;
	int quantidadeEstoque;
	int hora;
	int dia;
	int mes;
	int ano;
	int minutos;
	
	public void cadastrarProduto() {
		this.nome = JOptionPane.showInputDialog("Digite o nome:");
		this.valor = Double.parseDouble(JOptionPane.showInputDialog("Digite o valor:"));
		this.quantidadeEstoque = Integer.parseInt(JOptionPane.showInputDialog("Digite a quantidade do estoque:"));
	}

	public void exibirProduto() {
		System.out.println("Nome: " + nome);
		System.out.println("Valor: " +  valor);
		System.out.println("Quantidade em estoque: " + quantidadeEstoque);
		System.out.println("Hora: " + hora);
	}
	
}
