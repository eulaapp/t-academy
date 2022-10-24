function aplicarDesconto() {
    let valor = document.getElementById("valor");
    let aVista = document.getElementById("a-vista");
    let parcelado = document.getElementById("parcelado");

    if (parseFloat(valor.value) >= 100 && (aVista.checked)) {
        let valorComDesconto = 0.9 * valor.value
        alert("O valor com desconto é de R$" + parseFloat(valorComDesconto))
    }

}