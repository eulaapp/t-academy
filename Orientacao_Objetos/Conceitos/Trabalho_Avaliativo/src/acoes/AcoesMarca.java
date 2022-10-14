package acoes;

import java.util.ArrayList;
import javax.swing.JOptionPane;

import metodosInterface.Metodos;
import modelos.Marca;

public class AcoesMarca implements Metodos {

	// ArrayList para armazenar as marcas cadastradas
	public static ArrayList<Marca> dadosMarca = new ArrayList<>();

	@Override
	public void cadastrar() {
		Marca marca = new Marca();
		String nome = JOptionPane.showInputDialog("Digite o nome da marca que deseja cadastrar");

		while (nomeMarcaExiste(nome)) {
			nome = JOptionPane.showInputDialog("Digite o nome da marca que deseja cadastrar");
		}

		marca.setNome(nome);
		dadosMarca.add(marca);
		JOptionPane.showMessageDialog(null, "Marca cadastrada com sucesso!");
	}

	// Método para verificar se já existe uma marca cadastrada com o nome informado
	// pelo usuário
	private boolean nomeMarcaExiste(String nome) {
		for (int i = 0; i < dadosMarca.size(); i++) {
			if (nome.equals(dadosMarca.get(i).getNome())) {
				JOptionPane.showMessageDialog(null, "Já existe uma marca cadastrada com esse nome!");
				return true;
			}
		}

		return false;
	}

	@Override
	public void selecionar() {
		String listarMarcas = "Marcas cadastradas\n";
		for (int i = 0; i < dadosMarca.size(); i++) {
			listarMarcas += "\n" + dadosMarca.get(i).getNome();
		}
		JOptionPane.showMessageDialog(null, listarMarcas);
	}

	@Override
	public void pesquisar() {
		String termoPesquisado = JOptionPane.showInputDialog("Digite a marca que deseja pesquisar");
		String exibirTermoPesquisado = "";

		boolean encontrado = false;

		for (int i = 0; i < dadosMarca.size(); i++) {

			if (dadosMarca.get(i).getNome().contains(termoPesquisado)) {
				encontrado = true;
				exibirTermoPesquisado += "\n" + dadosMarca.get(i).getNome();
			}
		}

		if (encontrado) {
			JOptionPane.showMessageDialog(null, exibirTermoPesquisado);
		} else {
			JOptionPane.showMessageDialog(null, "Termo não encontrado.");
		}

	}

	@Override
	public void alterar() {
		String marca = JOptionPane.showInputDialog("Digite o nome da marca que deseja alterar");

		for (int i = 0; i < dadosMarca.size(); i++) {
			if (marca.equals(dadosMarca.get(i).getNome())) {
				dadosMarca.get(i).setNome(JOptionPane.showInputDialog("Digite o novo nome da marca"));
				JOptionPane.showMessageDialog(null, "Nome da marca foi alterado!");
			} else {
				JOptionPane.showMessageDialog(null, "Marca não encontrada!");
				break;
			}
		}

	}

	@Override
	public void remover() {
		String removerMarca = JOptionPane.showInputDialog("Informe o nome da marca que deseja remover");
		boolean existe = true;
		for (int i = 0; i < dadosMarca.size(); i++) {
			if (removerMarca.equals(dadosMarca.get(i).getNome()) && !dadosMarca.get(i).isPossuiProdutosCadastrados()) {
				dadosMarca.remove(i);
				JOptionPane.showMessageDialog(null, "Marca excluída!");
				existe = false;
			} else {
				JOptionPane.showMessageDialog(null, "Marca não encontrada!");
				break;
			}
		}

		if (existe == true) {
			marcaPossuiProdutos();
		}

	}

	// Método para verificar se a marca possui algum produto cadastrado
	public void marcaPossuiProdutos() {
		for (int i = 0; i < dadosMarca.size(); i++) {
			if (dadosMarca.get(i).isPossuiProdutosCadastrados()) {
				JOptionPane.showMessageDialog(null, "Essa marca possui produtos cadastrados e não pode ser excluída!");
			}
		}
	}

}
