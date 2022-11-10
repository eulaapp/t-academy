let artistas = [];

window.onload = function() {
    fetchArtistas();
}

function fetchArtistas() {
    fetch("http://localhost:8080/artistas")
    .then(retorno => retorno.json())
    .then(artisa => artistas = artisa)
    .then(() => exibirArtistas())
}

function exibirArtistas() {
    let tabela = document.getElementById("tabela");

    tabela.innerHTML = "";

    for(let i = 0; i < artistas.length; i++) {
        let linha = tabela.insertRow(-1);

        let colunaCodigo = linha.insertCell(0);
        let colunaNome = linha.insertCell(1);
        let colunaSelecionar = linha.insertCell(2);

        colunaCodigo.innerText = artistas[i].codigo;
        colunaNome.innerText = artistas[i].nome;
        colunaSelecionar.innerHTML = `<button onclick="selecionarArtista(${artistas[i].codigo})" class="btn btn-success">Selecionar</button>`;

    }
}

function cadastrarArtista() {
    let nome = document.getElementById("artista").value;

    if (nome.length < 3) {
        alert("O nome deve conter ao menos três caracteres.")
    } else {
        let obj = {
            "nome": nome
        }

        fetch("http://localhost:8080/artistas/cadastrar", {
            method: "POST",
            headers: {
                "accpet": "application/json",
                "content-type": "application/json"
            },
            body: JSON.stringify(obj)
        })
        .then(retorno => retorno.json())
        .then(retornoConvertido => {
            artistas.push(retornoConvertido);
            exibirArtistas();
        })

    }
}

function selecionarArtista(codigo) {

    fetch(`http://localhost:8080/artistas/filtrar/${codigo}`)
    .then(retorno => retorno.json())
    .then(retornoConvertido => {
        
        document.getElementById("btnCadastrar").style.display="none";

        document.getElementById("btnAlterar").style.display="inline-block";
        document.getElementById("btnRemover").style.display="inline-block";

        document.getElementById("codigoArtista").value = retornoConvertido.codigo;
        document.getElementById("artista").value = retornoConvertido.nome;
    });

}

function removerArtista() {
    let codigo = parseInt(document.getElementById("codigoArtista").value);

    fetch(`http://localhost:8080/artistas/remover/${codigo}`,
        {method: "DELETE"}
    )
    .then(() => {
        let posicaoVetor = artistas.findIndex(objLinha => {
            return objLinha.codigo == codigo
        })

        artistas.splice(posicaoVetor, 1);

        exibirArtistas();
        formularioPadrao();
    })
}

function alterarArtista() {
    let nome = document.getElementById("artista").value;
    let codigo = document.getElementById("codigoArtista").value;

    if (nome.length < 3) {
        alert("O nome deve conter ao menos três caracteres.")
    } else {
        let obj = {
            "codigo": codigo,
            "nome": nome
        }

        fetch("http://localhost:8080/artistas/alterarNome", {
            method: "PUT",
            headers: {
                "accpet": "application/json",
                "content-type": "application/json"
            },
            body: JSON.stringify(obj)
        })
        .then(retorno => retorno.json())
        .then(retornoConvertido => {
            let posicaoVetor = artistas.findIndex(objLinha => {
                return objLinha.codigo == codigo
            })

            artistas[posicaoVetor] = retornoConvertido;
            exibirArtistas();
            formularioPadrao();
        })

    }
}

function formularioPadrao() {

    document.getElementById("codigoArtista").value = "";
    document.getElementById("artista").value = "";

    document.getElementById("btnCadastrar").style.display = "inline-block";
    document.getElementById("btnAlterar").style.display = "none";
    document.getElementById("btnRemover").style.display = "none";
}