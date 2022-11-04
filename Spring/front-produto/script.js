// vetor de produtos
let vetor = [];

// executar a função para obter os produtos
obterProdutos()

// obter todos os produtos
function obterProdutos() {
    fetch("http://localhost:8080")
    .then(retorno => retorno.json())
    .then(produtos => vetor = produtos)
}

// listar os produtos do vetor na tabela 
function listarProdutos() {
    // obter a tabela
    let table = document.getElementById("tabela");

    // limpar conteúdo da tabela
    table.innerHTML = "";

    for(let i = 0; i < vetor.length; i++) {
        // criar linha
        let linha = tabela.insertRow(-1);

        // criar coluna
        let colunaCodigo = tabela.insertCell(0);
        let colunaNome = tabela.insertCell(1);
        let colunaValor = tabela.insertCell(2);
        let colunaSelecionar = tabela.insertCell(3);
    }
}