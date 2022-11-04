// vetor de produtos
let vetor = [];

// ao carregar a página html
window.onload = function() {
    // armazenar os produtos no vetor
    obterProdutos();
}

// obter todos os produtos
function obterProdutos() {
    fetch("http://localhost:8080")
    .then(retorno => retorno.json())
    .then(produtos => vetor = produtos)
    .then(() => listarProdutos())
}

// listar os produtos do vetor na tabela 
function listarProdutos() {
    // obter a tabela
    let tabela = document.getElementById("tabela");

    // limpar conteúdo da tabela
    tabela.innerHTML = "";

    for(let i = 0; i < vetor.length; i++) {
        // criar linha
        let linha = tabela.insertRow(-1);

        // criar coluna
        let colunaCodigo = linha.insertCell(0);
        let colunaNome = linha.insertCell(1);
        let colunaValor = linha.insertCell(2);
        let colunaSelecionar = linha.insertCell(3);

        // dados das colunas
        colunaCodigo.innerText = vetor[i].codigo;
        colunaNome.innerText = vetor[i].nome;
        colunaValor.innerText = vetor[i].valor;
        colunaSelecionar.innerHTML = `<button class="btn btn-success">Selecione</button>`;
    }
}