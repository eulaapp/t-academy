function validarCadastroUsuario() {

	let nome = document.getElementsByName("nome")[0].value;
	let sobrenome = document.getElementsByName("sobrenome")[0].value;
	let email = document.getElementsByName("email-cadastro")[0].value;
	let senha = document.getElementsByName("senha-cadastro")[0].value;

	if (nome == "") {
		alert("O nome nao pode estar vazio!");
		return false;
	} else if (sobrenome == "") {
		alert("O sobrenome nao pode estar vazio!");
		return false;
	} else if (email == "") {
		alert("O e-mail nao pode estar vazio!");
		return false;
	} else if (senha == "") {
		alert("A senha nao pode estar vazio!");
		return false;
	}
}

function validarLogin() {
	let email = document.getElementsByName("nome")[0].value;
	let senha = document.getElementsByName("senha")[0].value;
	
	if (email == "") {
		alert("O e-mail nao pode estar vazio!");
		return false;
	} else if (senha == "") {
		alert("A senha nao pode estar vazio!");
		return false;
	}
}