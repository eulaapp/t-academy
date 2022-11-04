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