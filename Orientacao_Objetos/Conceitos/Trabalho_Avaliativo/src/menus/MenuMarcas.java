package menus;

import javax.swing.JOptionPane;

import acoes.AcoesMarca;

public class MenuMarcas {

	public static void abrirMenuMarcas() {
		boolean continuarMenuMarcas = true;
		AcoesMarca marca = new AcoesMarca();

		while (continuarMenuMarcas) {
			int menuMarca = Integer.parseInt(JOptionPane.showInputDialog(
					"1 - Cadastrar \n2 - Selecionar \n3 - Pesquisar \n4 - Alterar \n5 - Remover \n6 - Sair"));
			switch (menuMarca) {
			case 1:
				marca.cadastrar();
				break;
			case 2:
				marca.selecionar();
				break;
			case 3:
				marca.pesquisar();
				break;
			case 4:
				marca.alterar();
				break;
			case 5:
				marca.remover();
				break;
			case 6:
				int sairMenuMarca = JOptionPane.showConfirmDialog(null, "Deseja sair do cadastro de marcas?");
				if (sairMenuMarca == 0) {
					continuarMenuMarcas = false;
				}
				break;
			default:
				JOptionPane.showMessageDialog(null, "Opção inválida. Informe um número de acordo com o informado.");
			}
		}
	}

}
