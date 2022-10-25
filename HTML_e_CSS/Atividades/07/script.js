function menorNumero() {

    let primeiroNumero = document.getElementById("numero1").value;
    let segundoNumero = document.getElementById("numero2").value;
    let terceiroNumero = document.getElementById("numero3").value;

    let min = Math.min(primeiroNumero, segundoNumero, terceiroNumero);

    alert("O menor número é: " + min)
}