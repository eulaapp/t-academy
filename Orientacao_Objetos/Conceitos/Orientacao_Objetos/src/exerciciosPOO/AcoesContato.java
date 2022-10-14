package exerciciosPOO;

import java.util.ArrayList;
import java.util.Scanner;

import javax.swing.JOptionPane;

public class AcoesContato implements Padrao {
	
	public static ArrayList<Contato> dados = new ArrayList<>();
	Scanner scan = new Scanner(System.in);

	@Override
	public void cadastrar() {
		
		Contato contato = new Contato();
				
		System.out.println("Digite o nome do contato: ");
		contato.setNome(scan.next());

		System.out.println("Digite o e-mail do contato: ");
		contato.setEmail(scan.next());
		
		System.out.println("Digite o telefone do contato");
		contato.setTelefone(scan.next());
		
		dados.add(contato);
		
	}

	@Override
	public void listar() {
		for(int i = 0; i < dados.size(); i++) {
			System.out.println("--------------------------");
			System.out.println("Codigo: "+ dados.get(i).getCodigo());
			System.out.println("Nome: "+ dados.get(i).getNome());
			System.out.println("E-mail: "+ dados.get(i).getEmail());
			System.out.println("Telefone: "+ dados.get(i).getTelefone());
			System.out.println("---------------------------");
		}
	}

	@Override
	public void pesquisar() {
		System.out.println("Digite o nome do contato pra pesquisar: ");
		String nome = scan.next();
		
		for (int i = 0; i < dados.size(); i++) {
			if (nome.equals(dados.get(i).getNome())) {
				System.out.println("Codigo: "+ dados.get(i).getCodigo());
				System.out.println("Nome: "+ dados.get(i).getNome());
				System.out.println("E-mail: "+ dados.get(i).getEmail());
				System.out.println("Telefone: "+ dados.get(i).getTelefone());
			} else {
				System.out.println("Contato não cadastrado");
			}
		}		
	}

	@Override
	public void alterar() {
		listar();
		System.out.println("Digite o nome contato que deseja alterar: ");
		String nome = scan.next();
		
		for (int i = 0; i < dados.size(); i++) {
			if (nome.equals(dados.get(i).getNome())) {
				dados.get(i).setNome(JOptionPane.showInputDialog("Qual o novo nome?"));
				dados.get(i).setEmail(JOptionPane.showInputDialog("Qual o novo email?"));
				dados.get(i).setTelefone(JOptionPane.showInputDialog("Qual o novo telefone?"));
			}
		}
	}

	@Override
	public void remover() {
		listar();
		System.out.println("Digite o nome do contato que deseja remover: ");
		String remover = scan.next();
		
		for (int i = 0; i < dados.size(); i++) {
			if (remover.equals(dados.get(i).getNome())) {
				dados.remove(i);
			}
		}
	}
}
