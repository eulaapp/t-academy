let brenaVotos = 0
let joaoVotos = 0


function votacao(voto) {
    let brena = document.getElementById("candidato1").value
    let joao = document.getElementById("candidato2").value
    let ralf = document.getElementById("candidato3").value
    let gustavo = document.getElementById("candidato4").value
    let nulo = document.getElementById("candidato5").value

    switch(voto) {
        case brena:
            brenaVotos++
            document.getElementById("brena").innerText = brenaVotos
        break;
        case joao:
            joaoVotos++
            document.getElementById("joao").innerText = joaoVotos
        break;

        case ralf:
        break;

        case gustavo:
        break;

        case nulo:
        break;
    }

}