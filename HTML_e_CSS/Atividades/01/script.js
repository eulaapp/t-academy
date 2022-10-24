function realizarMedia() {
    let nota1 = document.getElementById("nota1")
    let nota2 = document.getElementById("nota2")
    let alerta = document.getElementById("alerta")

    let media = (parseFloat(nota1.value) + parseFloat(nota2.value)) / 2

    alerta.innerHTML = media;
}