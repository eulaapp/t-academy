function valida() {
	let nome = document.getElementById("nome").value;
	let idade = parseInt(document.getElementById("idade").value);
	
	if (nome == "") {
		alert("Informe o nome");
		return false;
	} else if (idade < 0 || idade > 120) {
		alert("Idade inválida");
		return false;
	}
}