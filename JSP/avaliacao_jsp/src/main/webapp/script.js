function validarCadastroUsuario() {

	let nome = document.getElementsByName("nome")[0].value;
	let sobrenome = document.getElementsByName("sobrenome")[0].value;
	let email = document.getElementsByName("email-cadastro")[0].value;
	let senha = document.getElementsByName("senha-cadastro")[0].value;

	if (nome.trim() == "") {
		alert("O nome nao pode estar vazio!");
		return false;
	} else if (sobrenome.trim() == "") {
		alert("O sobrenome nao pode estar vazio!");
		return false;
	} else if (email.trim() == "") {
		alert("O e-mail nao pode estar vazio!");
		return false;
	} else if (senha.trim() == "") {
		alert("A senha nao pode estar vazio!");
		return false;
	}
}

function validarLogin() {
	debugger;
	let email = document.getElementsByName("email")[0].value;
	let senha = document.getElementsByName("senha")[0].value;
	
	if (email.trim() == "") {
		alert("O e-mail nao pode estar vazio!");
		return false;
	} else if (senha.trim() == "") {
		alert("A senha nao pode estar vazio!");
		return false;
	}
}