let brenaVotos = 0
let joaoVotos = 0
let ralfVotos = 0
let gustavoVotos = 0
let nuloVotos = 0

function votacao(voto) {
    let brena = document.getElementById("candidato1").value
    let joao = document.getElementById("candidato2").value
    let ralf = document.getElementById("candidato3").value
    let gustavo = document.getElementById("candidato4").value
    let nulo = document.getElementById("candidato5").value

    switch(voto) {
        case "Brena":
            brenaVotos++
            document.getElementById("brena").innerText = brenaVotos
        break;
        case "João":
            joaoVotos++
            document.getElementById("joao").innerText = joaoVotos
        break;

        case "Ralf":
            ralfVotos++
            document.getElementById("ralf").innerText = ralfVotos
        break;

        case "Gustavo":
            gustavoVotos++
            document.getElementById("gustavo").innerText = gustavoVotos
        break;

        case "Nulo":
            nuloVotos++
            document.getElementById("nulo").innerText = nuloVotos
        break;
    }

    let totalVotos = brenaVotos+joaoVotos+ralfVotos+gustavoVotos+nuloVotos
    document.getElementById("totalVotos").innerText = totalVotos

    let candidatoMaisVotado = Math.max(brenaVotos,joaoVotos,ralfVotos,gustavoVotos,nuloVotos)

    if (candidatoMaisVotado == brenaVotos) {
        document.getElementById("candidatoMaisVotado").innerText = "Brena"
    } else if (candidatoMaisVotado == joaoVotos) {
        document.getElementById("candidatoMaisVotado").innerText = "João"
    } else if (candidatoMaisVotado == ralfVotos) {
        document.getElementById("candidatoMaisVotado").innerText = "Ralf"
    } else if (candidatoMaisVotado == gustavoVotos) {
        document.getElementById("candidatoMaisVotado").innerText = "Gustavo"
    } else if (candidatoMaisVotado == nuloVotos) {
        document.getElementById("candidatoMaisVotado").innerText = "Nulo"
    }
    

}